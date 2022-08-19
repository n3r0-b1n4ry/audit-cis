# -*- mode: python ; coding: utf-8 -*-


block_cipher = pyi_crypto.PyiBlockCipher(key='hPtThR34tHun71nG')


a = Analysis(['agent.py'],
             pathex=['C:\\Users\\tiend\\OneDrive - actvn.edu.vn\\Desktop\\audit\\winps'],
             binaries=[],
             datas=[('./winagent/DoneSignal', './winagent/'), ('./winagent/global_var', './winagent/'), ('./winagent/GPOs', './winagent/'), ('./winagent/Initiate', './winagent/'), ('./winagent/sysinfo', './winagent/')],
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
          name='HPTAudit_IDC',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=True )
