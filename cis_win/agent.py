import os, ctypes, stat
import sys, subprocess
from psutil import WINDOWS, LINUX
import requests
import json
from time import sleep

from module import extract_ip

host = '10.1.12.237' #Q9
# host = '172.16.62.99' #IDC
# host = '172.16.38.90' #VDC
# host = '192.168.40.22'

DATAPATH = getattr(sys, '_MEIPASS', os.path.abspath(os.path.dirname(__file__)))

def isAdmin():
    try:
        f = (os.getuid() == 0)
    except Exception as e:
        f = (ctypes.windll.shell32.IsUserAnAdmin() != 0)
    return f

def winagent():
    try:
        if os.path.exists('C:/HPTAudit') != True:
            os.mkdir('C:/HPTAudit')
        agent = ''
        with open('C:/HPTAudit/AuditAgent.ps1', mode='w') as fo:
            agent += "$APIHOST=\"{apihost}\"\n$FTPHOST=\"{ftphost}\"\n\n".format(apihost=host, ftphost=host)
            agent += "$targetip=\"{targetip}\"\n\n".format(targetip=extract_ip().replace('.','_'))

            with open(os.path.join(DATAPATH, 'winagent', 'global_var'), mode='r', encoding='utf-8') as fi:
                agent += fi.read()
            with open(os.path.join(DATAPATH, 'winagent', 'Initiate'), mode='r', encoding='utf-8') as fi:
                agent += fi.read()
            with open(os.path.join(DATAPATH, 'winagent', 'sysinfo'), mode='r', encoding='utf-8') as fi:
                agent += fi.read()
            with open(os.path.join(DATAPATH, 'winagent', 'GPOs'), mode='r', encoding='utf-8') as fi:
                agent += fi.read()
            with open(os.path.join(DATAPATH, 'winagent', 'DoneSignal'), mode='r', encoding='utf-8') as fi:
                agent += fi.read()
            
            fo.write(agent)
            fo.close()
        with open('C:/HPTAudit/Agent.log', mode='w') as log:
            proc = subprocess.Popen(['powershell.exe', 'C:/HPTAudit/AuditAgent.ps1'], stdout=log, stderr=log)
            proc.communicate()
    except Exception as e:
        print(e)
    finally:
        os.remove('C:/HPTAudit/AuditAgent.ps1')

if isAdmin() == True:
    winagent()
else:
    sys.stderr.writelines('Please Run Agent as Administrator/Root')
    sys.exit()
