@echo off

GOTO START

:START
color 2
echo.
set /p choice=

IF %choice%==create-repo GOTO REPO
IF %choice%==help GOTO HELP
IF %choice%==create-controller GOTO CONTROLLER
IF %choice%==create-service GOTO SERVICE
IF %choice%==create-entity GOTO ENTITY
IF %choice%==create-project GOTO PROJECT

:REPO
    set /p projectName1=write the app name:
    set /p name=set your repository name EX. Example:
    BREAK > "../%projectName1%/model/repository/"%name%Repository.py"" 100
    echo [DONE] %name%Repository.py has been created
    echo from %projectName1%.model.entity.%name% import %name%>> "../%projectName1%/model/repository/"%name%Repository.py""
    echo from sqlalchemy.sql import text>> "../%projectName1%/model/repository/"%name%Repository.py""
    echo. >> "../%projectName1%/model/repository/"%name%Repository.py""
    echo. >> "../%projectName1%/model/repository/"%name%Repository.py""
    echo class %name%Repository():>> "../%projectName1%/model/repository/"%name%Repository.py""
    echo. >> "../%projectName1%/model/repository/"%name%Repository.py""
    echo     def __init__(self, mysql):>> "../%projectName1%/model/repository/"%name%Repository.py""
    echo         self.mysql = mysql>> "../%projectName1%/model/repository/"%name%Repository.py""
    GOTO START

:CONTROLLER
    set /p projectName1=write the app name:
    set /p name=set your controller name EX. Example:
    set /p lowerName=set your controller name EX. example:
    BREAK > "../%projectName1%/controller/"%name%Controller.py"" 100
    echo [DONE] %name%Controller.py has been created
    echo from flask import Blueprint, request>> "../%projectName1%/controller/"%name%Controller.py""
    echo from flask_cors import cross_origin>> "../%projectName1%/controller/"%name%Controller.py""
    echo. >> "../%projectName1%/controller/"%name%Controller.py""
    echo from %projectName1%.configuration.Config import mysql>> "../%projectName1%/controller/"%name%Controller.py""
    echo from %projectName1%.model.repository.%name%Repository import %name%Repository>> "../%projectName1%/controller/"%name%Controller.py""
    echo from %projectName1%.service.%name%Service import %name%Service>> "../%projectName1%/controller/"%name%Controller.py""
    echo from %projectName1%.utils.Util import Util >> "../%projectName1%/utils/"Util.py""
    echo. >> "../%projectName1%/controller/"%name%Controller.py""
    echo. >> "../%projectName1%/controller/"%name%Controller.py""
    echo %lowerName% = Blueprint('%name%Controller', __name__, url_prefix=Util.getURL('%lowerName%'))>> "../%projectName1%/controller/"%name%Controller.py""
    echo %lowerName%Repository = %name%Repository(mysql)>> "../%projectName1%/controller/"%name%Controller.py""
    echo %lowerName%Service = %name%Service(mysql, %lowerName%Repository)>> "../%projectName1%/controller/"%name%Controller.py""
    GOTO START

:SERVICE
    set /p projectName1=write the app name:
    set /p name=set your service name EX. Example:
    set /p lowerName=set your service name EX. example:
    BREAK > "../%projectName1%/service/"%name%Service.py"" 100
    echo [DONE] %name%Service.py has been created
    echo from %projectName1%.utils.Util import Util >> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo class %name%Service():>> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo     def __init__(self, mysql, %lowerName%Repository):>> "../%projectName1%/service/"%name%Service.py""
    echo         self.mysql = mysql>> "../%projectName1%/service/"%name%Service.py""
    echo         self.%lowerName%Repository = %lowerName%Repository>> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    GOTO START

:PROJECT
    set /p projectName=insert the app name:
    cd ..
    mkdir %projectName%
    cd %projectName%
    mkdir configuration
    cd configuration

    BREAK > Config.py 100
    echo from flask_sqlalchemy import SQLAlchemy>> Config.py
    echo from resources.config import config>> Config.py
    echo from flask import Flask>> Config.py
    echo.>> Config.py
    echo app = Flask(__name__)>> Config.py
    echo app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://' + config['username'] + ':' + config['password'] + '@' + config['host'] + '/' + config['db-name']>> Config.py
    echo app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False>> Config.py
    echo mysql = SQLAlchemy(app)>> Config.py

    cd ..
    mkdir utils
    mkdir controller
    mkdir model
    cd model
    mkdir entity
    mkdir repository
    cd ..
    mkdir service
    cd ..

    BREAK > app.py 100
    echo from %projectName%.configuration.Config import app>> app.py
    echo.>> app.py
    echo # controllers init>> app.py

    BREAK > start.bat 100
    echo @echo off>> start.bat
    echo GOTO START>> start.bat
    echo :START>> start.bat
    echo flask run>> start.bat
    echo pause > nul>> start.bat

    cd %projectName%
    cd utils
    BREAK > Util.py 100
    echo import datetime >> Util.py
    echo from flask import jsonify >> Util.py
    echo from resources.rest_service import config >> Util.py
    echo. >> Util.py
    echo. >> Util.py
    echo class Util(): >> Util.py
    echo. >> Util.py
    echo     RESOURCE_DOESNT_EXIST = "The resource you are trying to get, doesn't exist" >> Util.py
    echo     NOT_ENOUGH_PERMISSIONS = "You don't have enough permissions to do this" >> Util.py
    echo     RESOURCE_ALREADY_EXISTS = "The resource you are trying to add, already exists" >> Util.py
    echo. >> Util.py
    echo     @classmethod >> Util.py
    echo     def createList(cls, elements): >> Util.py
    echo         response = [] >> Util.py
    echo         for element in elements: >> Util.py
    echo             response.append(element.toJson()) >> Util.py
    echo         return jsonify(response) >> Util.py
    echo. >> Util.py
    echo     @classmethod >> Util.py
    echo     def createSuccessResponse(cls, success, param): >> Util.py
    echo         return jsonify({ >> Util.py
    echo             "date": str(datetime.now()), >> Util.py
    echo             "success": success, >> Util.py
    echo             "param": param, >> Util.py
    echo             "code": 200 >> Util.py
    echo         }) >> Util.py
    echo. >> Util.py
    echo     @classmethod >> Util.py
    echo     def createWrongResponse(cls, success, error, code): >> Util.py
    echo         return jsonify({ >> Util.py
    echo             "date": str(datetime.now()), >> Util.py
    echo             "success": success, >> Util.py
    echo             "error": error, >> Util.py
    echo             "code": code >> Util.py
    echo         }) >> Util.py
    echo. >> Util.py
    echo	 @classmethod >> Util.py
    echo	 def getURL(cls, controllerName): >> Util.py
    echo	     return '/api/v_' + config['version'].replace('.', '_') + '/' + controllerName >> Util.py
    echo. >> Util.py


    echo [DONE] The project has been created
    echo RESTART THE .BAT FILE TO CONTINUE
    pause > nul
    exit

:HELP
    echo create-repo
    echo create-service
    echo create-entity
    echo create-controller
    echo create-project
    GOTO START

:ENTITY
    set /p projectName1=write the app name:
    set /p name=set your entity name EX. Example:
    BREAK > "../%projectName1%/model/entity/"%name%.py"" 100
    echo [DONE] %name%.py has been created
    echo from %projectName1%.configuration.Config import mysql>> "../%projectName1%/model/entity/"%name%.py""
    echo. >> "../%projectName1%/model/entity/"%name%.py""
    echo class %name%(mysql.Model):>> "../%projectName1%/model/entity/"%name%.py""
    echo. >> "../%projectName1%/model/entity/"%name%.py""
    echo. >> "../%projectName1%/model/entity/"%name%.py""
    echo mysql.create_all()>> "../%projectName1%/model/entity/"%name%.py""
    GOTO START