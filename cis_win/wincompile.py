import PyInstaller.__main__

PyInstaller.__main__.run([
    './agent.py',
    '--onefile',
    '--key',
    'hPtThR34tHun71nG',
    '--name',
    'HPTAudit_Q9',
    '--add-data',
    './winagent/DoneSignal;./winagent/',
    '--add-data',
    './winagent/global_var;./winagent/',
    '--add-data',
    './winagent/GPOs;./winagent/',
    '--add-data',
    './winagent/Initiate;./winagent/',
    '--add-data',
    './winagent/sysinfo;./winagent/',
    '--distpath',
    './dist',
    '--workpath',
    './build'
])