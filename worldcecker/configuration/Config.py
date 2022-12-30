# from flask_sqlalchemy import SQLAlchemy
# from resources.config import config
from flask import Flask

app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://' + config['username'] + ':' + config['password'] + '@' + config['host'] + '/' + config['db-name']
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# mysql = SQLAlchemy(app)
