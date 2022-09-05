from flask import Flask
<<<<<<< HEAD
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
=======
app = Flask(__name__)@app.route("/")
def joke():
    return "I haven't slept for three days, because that would be too long"if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
>>>>>>> 14662b248222879fd614a167ff59e05965df5373
