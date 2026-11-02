#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Copyright (C) 2020, Modelica Association and contributors
All rights reserved.

Check Modelica HTML documentation for link validity
'''

import re
import os
import http.cookiejar
try:
    import urllib2
except ImportError:
    import urllib.request as urllib2
import ssl

from concurrent.futures import ProcessPoolExecutor as PoolExecutor

# See https://haacked.com/archive/2004/10/25/usingregularexpressionstomatchhtml.aspx/
PATTERN = re.compile(r'</?\w+((\s+\w+(\s*=\s*(?:\\"(.|\n)*?\\"|\'(.|\n)*?\'|[^\'">\s]+))?)+\s*|\s*)/?>',
    re.IGNORECASE)

def _getFileURLs(file_name):
    urls = []
    with open(file_name) as file:
        i = 1
        for line in file:
            for match in PATTERN.finditer(line):
                tag = match.group(0)
                tag = tag.strip('< >')
                if tag.split(' ')[0].lower() != 'a':
                    continue
                url = re.search(r'(?<=href=\\")http.*?(?=\\")', tag)
                if url is None:
                    continue
                url = url.group(0)
                if url in urls:
                    continue
                urls.append(url)
            i = i + 1
    return {file_name: urls}

def _getURLs(path):
    urls = {}
    for subdir, _, files in os.walk(path):
        for file in files:
            if os.path.splitext(file)[1] == '.mo':
                file_name = os.path.join(subdir, file)
                urls.update(_getFileURLs(file_name))
    return urls

def _checkURL(url):
    import sys
    print(f'[checkLinks] Checking {url}', flush=True, file=sys.stderr)
    timeout = 5
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}

    try:
        req = urllib2.Request(url, headers=headers)
        opener = urllib2.build_opener(
            urllib2.HTTPCookieProcessor(http.cookiejar.CookieJar()))
        rc = opener.open(req, timeout=timeout).getcode()
        print(f'[checkLinks]   -> {rc}', flush=True, file=sys.stderr)
        return (url, rc)
    except urllib2.HTTPError as e:
        rc = e.code
        print(f'[checkLinks]   -> HTTPError {rc}', flush=True, file=sys.stderr)
        if rc == 429:
            # Ignore too many requests
            return (url, 200)
        elif rc == 403:
            # Ignore forbidden (server blocking automated requests)
            return (url, 200)
        elif rc == 418:
            # Warn but don't fail on teapot (rate limiting from academic sites)
            print(f'[checkLinks] WARNING: {url} returned 418 (rate limited?)', flush=True, file=sys.stderr)
            return (url, 200)
        elif rc == 500:
            # Warn but don't fail on server errors (often transient, work in browser)
            print(f'[checkLinks] WARNING: {url} returned 500 (server error, may be transient)', flush=True, file=sys.stderr)
            return (url, 200)
        return (url, rc)
    except Exception as e:
        print(f'[checkLinks]   -> Timeout/error: {type(e).__name__}', flush=True, file=sys.stderr)
        # Treat all timeouts/errors as 0 (skip them)
        return (url, 0)

def checkLinks(path):
    if os.path.isdir(path):
        urls = _getURLs(path)
    elif os.path.isfile(path):
        urls = _getFileURLs(path)
    else:
        return 1

    all_urls = set()
    for url_list in urls.values():
        all_urls.update(url_list)

    errors = 0
    with PoolExecutor(max_workers=8) as executor:
        for url, rc in executor.map(_checkURL, all_urls):
            if rc != 200:
                errors = errors + 1
                # Only get first match for file name
                file_name = next(file_name for file_name, url_list in urls.items() if url in url_list)
                print('File "{0}": Error {1}for URL "{2}"'.format(file_name, '' if rc == 0 else str(rc) + ' ', url))
    return errors
