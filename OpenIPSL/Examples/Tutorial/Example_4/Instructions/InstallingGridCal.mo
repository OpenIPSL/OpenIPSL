within OpenIPSL.Examples.Tutorial.Example_4.Instructions;
model InstallingGridCal "Installing GridCal"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Installing GridCal</h5>
  <p>At this point, we have a record structure to keep the power flow solutions linked to the SMIB power system elements. It is our next task to populate the records and for that to be done we need a Python script that runs a library called <em>GridCal</em> which computes the power flow. To properly install <em>GridCal</em> please follow the steps listed below: </p>
  <ol type=\"1\">
    <li>Download <a href=\"https://www.python.org/downloads\">Python</a> and install it. Note that GridCal developpers encourage to install the latest version of Python <a href=\"https://github.com/SanPen/GridCal?tab=readme-ov-file#package-installation\">here</a>.
    <hr>
    <p>&#x1F4CC; To install Python for all users you must first run the installer as administrator. Then, you need to choose the <strong>Customize installation</strong> option. Click the <strong>Next</strong> button, which will open the <strong>Advanced Options</strong> window. Finally, tick the <em>Install Python 3.x for all users</em> checkbox before clicking the <strong>Install</strong> button. </p>
    <p>&#x1F4CC; Choosing the <strong>Customize installation</strong> option will also allow you to customize the install location. </p>
    <p>&#x1F4CC; If you want Python to be recognized as a command in every console/command window you need to add it to <strong>PATH</strong>. This can be done by clicking the <em>Add python.exe to PATH</em> checkbox from the initial window. </p>
    <hr>
    </li>
    <li>(Optional) Create a new Python <em>virtual environment</em> to encapsulate the GridCal Installation and its dependencies.
    <hr>
    <p>&#x1F4CC; <em>Virtual environments</em> allow you to separate particular experimental setups from the generic Python installation. This way, you can install GridCal and its dependencies on a virtual environment, which could later be removed without affecting your main Python installation. </p>
    <hr>
      <ol type=\"a\">
        <li>Open a command window/console and browse to the path where you want to create the <em>virtual environment</em>. </li>
        <li>Install the <strong>virtualenv</strong> tool by using the following command:
        <blockquote><pre>
<strong>python</strong> -m <strong>pip install</strong> virtualenv
        </pre></blockquote>
        <blockquote><pre>
Example:
C:\\Users\\Miguel\\SMIB_Example><strong>python</strong> -m <strong>pip</strong> list
Package Version
------- -------
pip     24.2

C:\\Users\\Miguel\\SMIB_Example><strong>python</strong> -m <strong>pip install</strong> virtualenv
Collecting virtualenv
  Downloading virtualenv-20.27.0-py3-none-any.whl.metadata (4.5 kB)
...
Installing collected packages: distlib, platformdirs, filelock, virtualenv
Successfully installed distlib-0.3.9 filelock-3.16.1 platformdirs-4.3.6 virtualenv-20.27.0

C:\\Users\\Miguel\\SMIB_Example>
        </pre></blockquote>
        </li>
        <li>Type the following command where <font color=\"blue\"><code>&lt;&lt;env_name&gt;&gt;</code></font> should be replaced by the actual name you want to give to the <em>environment</em> (e.g., <font color=\"blue\"><code>openipsl_tutorial</code></font>).
        <blockquote><pre>
<strong>python</strong> -m venv &lt;&lt;env_name&gt;&gt;
        </pre></blockquote>
    <hr>
    <p>&#x1F4CC; A folder with the same name as your virtual environment (i.e., <font color=\"blue\"><code>&lt;&lt;env_name&gt;&gt;</code></font>) will be created in your current directory. </p>
    <hr>
        </li>
      </ol>
    </li>
    <li>(Optional) Activate the environment by calling the <strong>activate</strong> script located under .\\<font color=\"blue\"><code>&lt;&lt;env_name&gt;&gt;</code></font>\\Scripts\\:
    <blockquote><pre>
C:\\Users\\Miguel\\SMIB_Example>.\\openipsl_tutorial\\Scripts\\<strong>activate</strong>

<strong>(openipsl_tutorial)</strong> C:\\Users\\Miguel\\SMIB_Example>
    </pre></blockquote>
    <hr>
    <p>&#x1F4CC; Please notice that whenever you want to use your environment again and your environment session is no longer open, you first need to open a command prompt/console, then locate the path where the environment is and finally call the <font color=\"blue\"><code>activate</code></font> script as indicated above. An environment session is typically finalized by calling the <font color=\"blue\"><code>deactivate</code></font> script. </p>
    <hr>
    <p>After successfully activating a virtual environment you will see the name of the environment enclosed in parenthesis as shown below</p>
    <blockquote><pre>
<strong>(openipsl_tutorial)</strong> C:\\Users\\Miguel\\SMIB_Example>
    </pre></blockquote>
    </li>
    <li>Clean <code>pip</code> cache.
    <blockquote><pre>
<strong>python</strong> -m <strong>pip cache purge</strong>
    </pre></blockquote>
    </li>
    <li>Install the <strong>gridcal</strong> python package as follows:
    <blockquote><pre>
(openipsl_tutorial) C:\\Users\\Miguel\\SMIB_Example><strong>python</strong> -m <strong>pip install</strong> gridcal
Collecting gridcal
  Using cached GridCal-5.1.52.tar.gz (1.0 MB)
  Installing build dependencies ... done
  Getting requirements to build wheel ... done
  Preparing metadata (pyproject.toml) ... done
Collecting setuptools>=41.0.1 (from gridcal)
  Using cached setuptools-75.2.0-py3-none-any.whl.metadata (6.9 kB)
Collecting wheel>=0.37.2 (from gridcal)
...
Successfully built gridcal GridCalEngine grapheme
Installing collected packages: xlwt, wcwidth, pywin32, pytz, py4j, pure-eval, grapheme, xlrd, wrapt, wheel, websockets, urllib3, tzdata, traitlets, tornado, threadpoolctl, six, shiboken6, setuptools, pyzmq, pyqtdarktheme, pyparsing, pygments, psutil, prompt-toolkit, pluggy, platformdirs, pillow, parso, packaging, numpy, networkx, nest-asyncio, llvmlite, kiwisolver, joblib, iniconfig, idna, html5lib-modern, geographiclib, future, fonttools, executing, et-xmlfile, dill, decorator, debugpy, darkdetect, cycler, colorama, cloudpickle, charset-normalizer, chardet, certifi, about-time, tqdm, scipy, requests, rdflib, qtpy, python-dateutil, pytest, PySide6-Essentials, pyproj, pyarrow, openpyxl, opencv-python, numba, nptyping, matplotlib-inline, jupyter-core, jedi, highspy, h5py, geopy, Deprecated, contourpy, comm, cma, autograd, asttokens, alive-progress, stack-data, scikit-learn, PySide6-Addons, pandas, matplotlib, jupyter-client, hyperopt, windpowerlib, PySide6, pymoo, pvlib, ipython, ipykernel, qtconsole, GridCalEngine, gridcal
Successfully installed Deprecated-1.2.14 GridCalEngine-5.1.52 PySide6-6.6.3.1 PySide6-Addons-6.6.3.1 PySide6-Essentials-6.6.3.1 about-time-4.2.1 alive-progress-3.1.5 asttokens-2.4.1 autograd-1.7.0 certifi-2024.8.30 chardet-5.2.0 charset-normalizer-3.4.0 cloudpickle-3.1.0 cma-3.2.2 colorama-0.4.6 comm-0.2.2 contourpy-1.3.0 cycler-0.12.1 darkdetect-0.8.0 debugpy-1.8.7 decorator-5.1.1 dill-0.3.9 et-xmlfile-1.1.0 executing-2.1.0 fonttools-4.54.1 future-1.0.0 geographiclib-2.0 geopy-2.4.1 grapheme-0.6.0 gridcal-5.1.52 h5py-3.12.1 highspy-1.8.0 html5lib-modern-1.2 hyperopt-0.2.7 idna-3.10 iniconfig-2.0.0 ipykernel-6.29.5 ipython-8.28.0 jedi-0.19.1 joblib-1.4.2 jupyter-client-8.6.3 jupyter-core-5.7.2 kiwisolver-1.4.7 llvmlite-0.43.0 matplotlib-3.9.2 matplotlib-inline-0.1.7 nest-asyncio-1.6.0 networkx-3.4.2 nptyping-2.5.0 numba-0.60.0 numpy-1.26.4 opencv-python-4.10.0.84 openpyxl-3.1.5 packaging-24.1 pandas-2.2.3 parso-0.8.4 pillow-11.0.0 platformdirs-4.3.6 pluggy-1.5.0 prompt-toolkit-3.0.48 psutil-6.1.0 pure-eval-0.2.3 pvlib-0.11.1 py4j-0.10.9.7 pyarrow-17.0.0 pygments-2.18.0 pymoo-0.6.1.3 pyparsing-3.2.0 pyproj-3.7.0 pyqtdarktheme-0.1.7 pytest-8.3.3 python-dateutil-2.9.0.post0 pytz-2024.2 pywin32-308 pyzmq-26.2.0 qtconsole-5.6.0 qtpy-2.4.1 rdflib-7.1.0 requests-2.32.3 scikit-learn-1.5.2 scipy-1.14.1 setuptools-75.2.0 shiboken6-6.6.3.1 six-1.16.0 stack-data-0.6.3 threadpoolctl-3.5.0 tornado-6.4.1 tqdm-4.66.5 traitlets-5.14.3 tzdata-2024.2 urllib3-2.2.3 wcwidth-0.2.13 websockets-13.1 wheel-0.44.0 windpowerlib-0.2.2 wrapt-1.16.0 xlrd-2.0.1 xlwt-1.3.0

(openipsl_tutorial) C:\\Users\\Miguel\\SMIB_Example>
    </pre></blockquote>
    </li>
    <li>Verify that the Python packages were installed correctly, especially <em>GridCal v5.1.52 or newer</em>:
    <blockquote><pre>
(openipsl_tutorial) C:\\Users\\Miguel\\SMIB_Example><strong>python</strong> -m <strong>pip list</strong>
Package            Version
------------------ -----------
about-time         4.2.1
alive-progress     3.1.5
asttokens          2.4.1
...
grapheme           0.6.0
GridCal            5.1.52
GridCalEngine      5.1.52
...
ipykernel          6.29.5
ipython            8.28.0
...
jupyter_core       5.7.2
...
matplotlib         3.9.2
matplotlib-inline  0.1.7
nest-asyncio       1.6.0
networkx           3.4.2
...
numpy              1.26.4
openpyxl           3.1.5
...
pandas             2.2.3
...
pywin32            308
pyzmq              26.2.0
qtconsole          5.6.0
QtPy               2.4.1
...
scipy              1.14.1
setuptools         75.2.0
...
xlrd               2.0.1
xlwt               1.3.0
    </pre></blockquote>
    <hr>
    <p>&#x1F4CC; Remember that GridCal has only been installed in the current environment. Therefore, whenever you use a script that requires this library the environment should be activated.</p>
    <hr>
    </li>
    <li>Test your installation running this Python command:
    <blockquote><pre>
<strong>import</strong> GridCalEngine.api as gce
    </pre></blockquote>
    <blockquote><pre>
(openipsl_tutorial) C:\\Users\\Miguel\\SMIB_Example><strong>python</strong>
Python 3.12.7 (tags/v3.12.7:0b05ead, Oct  1 2024, 03:06:41) [MSC v.1941 64 bit (AMD64)] on win32
Type \"help\", \"copyright\", \"credits\" or \"license\" for more information.
>>> import GridCalEngine.api as gce
>>>
    </pre></blockquote>
    <p>As shown above you should not get any errors.</p>
    </li>
    <li>(<strong>Optional but recommended</strong>) Install <font color=\"blue\"><code>JupyterLab</code></font> by using <code>pip</code> inside of your environment:
    <blockquote><pre>
<strong>pip install</strong> jupyterlab
    </pre></blockquote>
    <p>You can deactivate your environment at any time when you no longer require GridCal by using the following command:</p>
    <blockquote><pre>
.\\<font color=\"blue\"><code>&lt;&lt;env_name&gt;&gt;</code></font>\\Scripts\\<strong>deactivate</strong>
    </pre></blockquote>
        </li>
  </ol>
</html>"));
end InstallingGridCal;
