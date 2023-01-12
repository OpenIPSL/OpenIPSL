within OpenIPSL.Examples.Tutorial.Example_4.Instructions;
model InstallingGridCal "Installing GridCal"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Installing GridCal</h5>
  <p>At this point, we have a record structure to keep the power flow solutions linked to the SMIB power system elements. It is our next task to populate the records and for that to be done we need a python script that runs a library called <em>GridCal</em> which computes the power flow. To properly install <em>GridCal</em> please follow the steps listed below: </p>
  <ol type=\"1\">
    <li>Install <strong>Miniconda</strong>. Go to the <a href=\"https://docs.conda.io/en/latest/miniconda.html\">Miniconda website</a>, download the installer depending on the platform of your choice and install it. </li>
    <li>Create a new Miniconda <em>environment</em> that will handle the GridCal Installation.
      <ol type=\"a\">
        <li>Open a Command Prompt / Terminal window and browse to the path where you want to create the <em>environment</em>. </li>
        <li>Type the following command where <font color=\"blue\"><code>&lt;&lt;env_name&gt;&gt;</code></font> should be replaced by the actual name you want to give to the <em>environment</em>.
        <blockquote><pre>
<strong>conda create</strong> -n &lt;&lt;env_name&gt;&gt; python=3.9
        </pre></blockquote>
        </li>
        <li>Accept any python packages required to be installed by typing <strong>Y</strong> when prompted:
          <blockquote><pre>
The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    ca-certificates-2022.10.11 |       haa95532_0         125 KB
    certifi-2022.9.24          |   py39haa95532_0         154 KB
    openssl-1.1.1s             |       h2bbff1b_0         5.5 MB
    pip-22.3.1                 |   py39haa95532_0         2.7 MB
    python-3.9.15              |       h6244533_2        19.4 MB
    setuptools-65.5.0          |   py39haa95532_0         1.1 MB
    sqlite-3.40.0              |       h2bbff1b_0         891 KB
    tzdata-2022g               |       h04d1e81_0         114 KB
    ------------------------------------------------------------
                                           Total:        30.1 MB

The following NEW packages will be INSTALLED:

  ca-certificates    pkgs/main/win-64::ca-certificates-2022.10.11-haa95532_0
  certifi            pkgs/main/win-64::certifi-2022.9.24-py39haa95532_0
  openssl            pkgs/main/win-64::openssl-1.1.1s-h2bbff1b_0
  pip                pkgs/main/win-64::pip-22.3.1-py39haa95532_0
  python             pkgs/main/win-64::python-3.9.15-h6244533_2
  setuptools         pkgs/main/win-64::setuptools-65.5.0-py39haa95532_0
  sqlite             pkgs/main/win-64::sqlite-3.40.0-h2bbff1b_0
  tzdata             pkgs/main/noarch::tzdata-2022g-h04d1e81_0
  vc                 pkgs/main/win-64::vc-14.2-h21ff451_1
  vs2015_runtime     pkgs/main/win-64::vs2015_runtime-14.27.29016-h5e58377_2
  wheel              pkgs/main/noarch::wheel-0.37.1-pyhd3eb1b0_0
  wincertstore       pkgs/main/win-64::wincertstore-0.2-py39haa95532_2

Proceed ([y]/n)?
          </pre></blockquote>
        </li>
      </ol>
    </li>
    <li>Activate the environment. Type the command shown below and do not forget to replace the <font color=\"blue\"><code>&lt;&lt;env_name&gt;&gt;</code></font> expression by the actual name you gave to the environment in step 2.b.
    <blockquote><pre>
<strong>conda activate</strong> &lt;&lt;env_name&gt;&gt;
    </pre></blockquote>
    <hr>
    <p>&#x1F4CC; Please notice that whenever you want to use your environment again and your environment session is no longer open, you first need to open a command prompt / terminal window, then locate the path where the environment is and finally type the <font color=\"blue\"><code>conda activate</code></font> command as indicated above. An environment session is typically finalized by typing the <font color=\"blue\"><code>conda deactivate</code></font> command. </p>
    <hr>
    <p>After successfully activating a miniconda environment you will see the name of the environment enclosed in parenthesis as shown below</p>
    <blockquote><pre>
<strong>(openipsl_tutorial)</strong> C:\\Users\\Miguel>
    </pre></blockquote>
    </li>
    <li>Upgrade <code>pip</code> (optional).
    <p>On Windows:</p>
    <blockquote><pre>
<strong>python</strong> -m pip install -U pip
    </pre></blockquote>
    <p>On Linux/macOS:</p>
    <blockquote><pre>
<strong>pip</strong> install -U pip
    </pre></blockquote>
    <p>You should get something similar to</p>
    <blockquote><pre>
C:\\Users\\Miguel>conda activate openipsl_tutorial

(openipsl_tutorial) C:\\Users\\Miguel>python -m pip install -U pip
Requirement already satisfied: pip in c:\\programdata\\miniconda3\\envs\\openipsl_tutorial\\lib\\site-packages (##.3.1)

...
Succesfully installed pip-22.3.1
    </pre></blockquote>
    </li>
    <li>Clean <code>pip</code> cache.
    <blockquote><pre>
<strong>python</strong> -m pip cache purge
    </pre></blockquote>
    </li>
    <li>Go to the <a href=\"https://github.com/SanPen/GridCal\">GridCal github page</a> and then click the <em>Releases</em> link. You can either clone the <em>release</em>, if you feel familiar with <em>git</em>, or download the <em>source code zip file</em>. We recommend installing the v4.0.0 release (hash <em>d1a065a</em>) because we already tested it.
    <p>To clone the release use the following git commands:</p>
    <blockquote><pre>
<strong>git clone</strong> https://github.com/SanPen/GridCal my_gridcal
<strong>cd</strong> my_gridcal
<strong>git reset</strong> --hard d1a065a
    </pre></blockquote>
    <p>In case you decided to download the zip file manually, unzip it to a convenient location.</p>
    </li>
    <li>Go back to the command prompt/terminal window and navigate to the path where you have your local GridCal repo clone or unzipped files. If you use the <code>dir</code> command you should be able to see the following list of files:
    <blockquote><pre>
(openipsl_tutorial) C:\\Users\\Miguel\\Downloads>cd GridCal-4.5.1

(openipsl_tutorial) C:\\Users\\Miguel\\Downloads\\GridCal-4.5.1>dir
 Volume in drive C has no label.
 Volume Serial Number is ECE3-A3D0

 Directory of C:\\Users\\Miguel\\Downloads\\GridCal-4.5.1

05/20/2022  04:44 PM    DIR          .
05/20/2022  04:44 PM    DIR          ..
05/20/2022  04:42 PM               256 .gitignore
05/20/2022  04:42 PM               932 .gitlab-ci.yml
05/20/2022  04:42 PM    DIR            .idea
05/20/2022  04:42 PM                25 .readthedocs.yml
05/20/2022  04:42 PM               315 .travis.yml
05/20/2022  04:44 PM    DIR            build
05/20/2022  04:42 PM               151 CONTRIBUTING.md
05/20/2022  04:42 PM    DIR            doc
05/20/2022  04:44 PM    DIR            GridCal.egg-info
05/20/2022  04:42 PM    DIR            Grids_and_profiles
05/20/2022  04:42 PM             7,440 LICENSE.md
05/20/2022  04:42 PM    DIR            pics
05/20/2022  04:42 PM                50 pytest.ini
05/20/2022  04:42 PM             5,990 README.md
05/20/2022  04:42 PM                59 requirements-dev.txt
05/20/2022  04:42 PM               307 requirements.txt
05/20/2022  04:42 PM             1,115 requirements_nose.txt
05/20/2022  04:42 PM               319 requirements_venv.txt
05/20/2022  04:42 PM             9,976 setup.py
05/20/2022  04:57 PM    DIR            src
05/20/2022  04:42 PM               118 tox.ini
              14 File(s)         27,053 bytes
               9 Dir(s)  558,128,394,240 bytes free

(openipsl_tutorial) C:\\Users\\Miguel\\Downloads\\GridCal-4.5.1>
    </pre></blockquote>
    </li>
    <li>Navigate to the <font color=\"blue\"><code>src</code></font> folder by using the <code>cd</code> command:
    <blockquote><pre>
<strong>cd</strong> src
    </pre></blockquote>
    </li>
    <li>( <strong>Important</strong>) <em>Make sure your conda environment is activated</em>. Execute the following command:
    <blockquote><pre>
<strong>python</strong> -m pip install .
    </pre></blockquote>
    <hr>
    <p>&#x1F4CC; There are a bunch of packages required to be installed and it can take a while to complete it. Please remember that GridCal has only been installed in the current environment. Therefore, whenever you use a script that requires this library the environment should be activated.</p>
    <hr>
    </li>
    <li>Test your installation running this python command:
    <blockquote><pre>
<strong>from</strong> GridCal.Engine <strong>import</strong> *
    </pre></blockquote>
    <blockquote><pre>
(openipsl_tutorial) C:\\Users\\Miguel\\Downloads\\GridCal-4.5.1\\src>python
Python 3.9.15 (main, Nov 24 2022, 14:39:17) [MSC v.1916 64 bit (AMD64)] on win32
Type \"help\", \"copyright\", \"credits\" or \"license\" for more information.
>>> from GridCal.Engine import *
Bentayga is not available
Newton native unavailable
>>>
    </pre></blockquote>
    <p>As shown above you should not get any errors.</p>
    </li>
    <li>( <strong>Optional but recommended</strong>) Install <font color=\"blue\"><code>JupyterLab</code></font> by using <code>pip</code> inside of your environment:
    <blockquote><pre>
<strong>pip install</strong> jupyterlab
    </pre></blockquote>
    <p>You can deactivate your environment at any time when you no longer require GridCal by using the following command:</p>
    <blockquote><pre>
<strong>conda deactivate</strong>
    </pre></blockquote>
        </li>
  </ol>
</html>"));
end InstallingGridCal;
