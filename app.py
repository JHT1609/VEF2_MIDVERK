from bottle import run, route, template, static_file, error
import requests, os

response = requests.get('http://apis.is/petrol')

data = response.json()

@route('/')
def index():
    return template('index',data=data)

#static file route
@route('/static/<filename>')
def static_server(filename):
    return static_file(filename,root=('./static_files'))

@route('/company/<c>')
def company(c):
    return template('company', c=c, data=data)

@route('/details/<key>')
def details(key):
    return template('details', key=key, data=data)

run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
