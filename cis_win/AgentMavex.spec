# -*- mode: python ; coding: utf-8 -*-


block_cipher = pyi_crypto.PyiBlockCipher(key='hPtThR34tHun71nG')


a = Analysis(['agent.py'],
             pathex=['C:\\Users\\tiend\\Desktop\\threat_hunting\\deploy\\agent'],
             binaries=[],
             datas=[('./winagent/Connections', './winagent/'), ('./winagent/DoneSignal', './winagent/'), ('./winagent/Drivers', './winagent/'), ('./winagent/DumpAll', './winagent/'), ('./winagent/Firewall_Configurations', './winagent/'), ('./winagent/Firewall_Status', './winagent/'), ('./winagent/GetUserGroup', './winagent/'), ('./winagent/global_var', './winagent/'), ('./winagent/GPOs', './winagent/'), ('./winagent/Hashes', './winagent/'), ('./winagent/Initiate', './winagent/'), ('./winagent/Processes', './winagent/'), ('./winagent/Registry', './winagent/'), ('./winagent/ScanMem', './winagent/'), ('./winagent/Services', './winagent/'), ('./winagent/System_informations', './winagent/'), ('./winagent/Task_Schedule', './winagent/'), ('./winagent/WinEvt', './winagent/'), ('./winagent/YaraRule', './winagent/')],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          [],
          name='AgentMavex',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=True )
