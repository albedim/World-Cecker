from flask import Blueprint, request
from flask_cors import cross_origin

# from worldcecker.configuration.Config import mysql
# from worldcecker.model.repository.WeatherRepository import WeatherRepository
from worldcecker.service.WeatherService import WeatherService
from worldcecker.utils.Util import Util

weather = Blueprint('WeatherController', __name__, url_prefix=Util.getURL('weather'))
# weatherRepository = WeatherRepository(mysql)
weatherService = WeatherService()


# @endpoint For getting the real time weather of a city
@weather.route("/get", methods=['GET'])
@cross_origin()
def get():
    return weatherService.getWeather(request.args.get('city'))
