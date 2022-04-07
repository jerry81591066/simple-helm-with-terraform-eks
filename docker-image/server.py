from flask import request, Flask
import json

server = Flask(__name__)

@server.route('/')
def home():
    return '<h1>Hello World!</h1>'

@server.route('/favicon.ico')
def favicon():
    return ('', 204)

if __name__ == '__main__':
    server.run(debug = True, host = '0.0.0.0')
