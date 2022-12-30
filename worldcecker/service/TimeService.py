from worldcecker.utils.Util import Util
from flask import jsonify

#
# @author: albedim <dimaio.albe@gmail.com>
# Created on: 30/12/22
# Created at: 16:14
# Version: 1.0.0
# Description: This is the class for the time service
#


class TimeService():

    def __init__(self):
        pass

    @classmethod
    def getTime(cls, city: str):
        try:
            return jsonify({
                'zone': city,
                'date': Util.getData(city='Time_In_' + city, param='span.KfQeJ'),
                'time': Util.getData(city='Time_In_' + city, param='div.gsrt.vk_bk.FzvWSb.YwPhnf')
            })
        except Exception:
            return Util.createWrongResponse(False, "An error occured, Please Try Again", 406)

