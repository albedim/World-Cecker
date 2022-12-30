from flask import Blueprint, request
from flask_cors import cross_origin
 
# from worldcecker.configuration.Config import mysql
# from worldcecker.model.repository.TimeRepository import TimeRepository
from worldcecker.service.TimeService import TimeService
from worldcecker.utils.Util import Util

time = Blueprint('TimeController', __name__, url_prefix=Util.getURL('time'))
# timeRepository = TimeRepository(mysql)
timeService = TimeService()


# @endpoint For getting the current time of a city
@time.route("/get", methods=['GET'])
@cross_origin()
def get():
    return timeService.getTime(request.args.get('city'))
