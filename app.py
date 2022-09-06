# Import flask module
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello Flask! Running In A Docker Container on Azure Kubernetes'

# main driver function
if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port='443' ssl_context=('cert.pem', 'key.pem'))
