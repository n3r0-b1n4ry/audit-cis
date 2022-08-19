import os
import base64
import json

# UPLOAD_FOLDER = 'C:/Users/tiend/OneDrive - actvn.edu.vn/Desktop/audit/upload'
UPLOAD_FOLDER = '/var/audit/upload'

def upload_file(files):
    print(files.get("filename"))
    filename = files.get("filename")

    if (files.get("filename")):
        try:
            raw = base64.b64decode(files.get("data"))

            with open(os.path.join(UPLOAD_FOLDER, filename), mode = "wb") as f:
                f.write(raw)
                f.close()
        except Exception as ex:
            print(ex)