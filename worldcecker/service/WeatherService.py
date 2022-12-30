from worldcecker.utils.Util import Util

#
# @author: albedim <dimaio.albe@gmail.com>
# Created on: 30/12/22
# Created at: 14:04
# Version: 1.0.0
# Description: This is the class for the weather service
#


class WeatherService():

    def __init__(self):
        pass

    @classmethod
    def getWeather(cls, city: str):
        try:
            return {
                'location': Util.getData('Weather_' + city, '#wob_loc'),
                'precipitation': Util.getData('Weather_' + city, '#wob_pp'),
                'humidity': Util.getData('Weather_' + city, '#wob_hm'),
                'wind': Util.getData('Weather_' + city, '#wob_ws'),
                'details': Util.getData('Weather_' + city, '#wob_dc'),
                'temperature': Util.getData('Weather_' + city, '#wob_tm')
            }
        except Exception:
            return Util.createWrongResponse(False, "An Error occured, Try Again", 406)