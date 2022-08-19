from flask import Flask, jsonify, request
import json
from functions import upload_file
from functions import UPLOAD_FOLDER

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 32 * 1024 * 1024

@app.route('/upload', methods=['POST'])
def uploadfile ():
    resp = jsonify({})
    print(request.remote_addr)

    print(request.data)
    data = json.loads(request.data)

    if (data == None):
        resp.status_code = 404
        return resp

    try:
        if data.get("filename") == '':
            resp = jsonify({'message' : 'No file selected for uploading'})
            resp.status_code = 400
            return resp
        # print(data.get("filename"))
        data["filename"] = request.remote_addr.replace('.','_') + '_' + data.get("filename")
    except Exception as e:
        print(e)
        resp.status_code = 404
        return resp

    upload_file(data)

    resp = jsonify({'message':'successful'})
    resp.status_code = 200
    return resp




if __name__ == "__main__":
	app.run(host="0.0.0.0", port="6886", debug=True, use_reloader=False)


