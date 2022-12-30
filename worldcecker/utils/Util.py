from datetime import datetime

import requests
from bs4 import BeautifulSoup
from flask import jsonify 
from resources.rest_service import config 
 
 
class Util(): 
 
    RESOURCE_DOESNT_EXIST = "Invalid zone. Please use '/zones' to see all the avaible countries"
    NOT_ENOUGH_PERMISSIONS = "You don't have enough permissions to do this" 
    RESOURCE_ALREADY_EXISTS = "The resource you are trying to add, already exists" 
 
    @classmethod 
    def createList(cls, elements): 
        response = [] 
        for element in elements: 
            response.append(element.toJson()) 
        return jsonify(response) 
 
    @classmethod 
    def createSuccessResponse(cls, success, param): 
        return jsonify({ 
            "date": str(datetime.now()), 
            "success": success, 
            "param": param, 
            "code": 200 
        }) 
 
    @classmethod 
    def createWrongResponse(cls, success, error, code): 
        return jsonify({ 
            "date": str(datetime.now()), 
            "success": success, 
            "error": error, 
            "code": code 
        })

    @classmethod
    def getZones(cls):
        return {
            'America': [
                'New_York',
            ],
            'US': [
                'Central',
                'Arizona',
                'Alaska',
                'East Indiana'
            ],
            'Asia': [
                'Kolkata'
            ],
            'Australia': [
                'Sydney'
            ],
            'Canada': [
                'Atlantic'
            ],
            'Brazil': [
                'East'
            ],
            'Chile': [
                'EasterIsland'
            ],
            'Cuba': [],
            'Egypt': [],
            'Europe': [
                'Amsterdam',
                'Athens',
                'Berlin',
                'Istanbul',
                'Jersey',
                'London',
                'Moscow',
                'Paris',
                'Rome'
            ],
            'HongKong': [],
            'Iceland': [],
            'Indian': [
                'Maldives'
            ],
            'Iran': [],
            'Israel': [],
            'Japan': []
        }

    @classmethod
    def getHeaders(cls):
        return {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) ' +
            'Chrome/58.0.3029.110 Safari/537.3'
        }

    @classmethod
    def getData(cls, city, param):
        request = requests.get(
            f'https://www.google.com/search?q={city}&oq={city}&aqs=chrome.0.35i39l2j0l4j46j69i60.6128j1j ' +
            '7&sourceid=chrome&ie=UTF-8',
            headers=cls.getHeaders()
        )
        soup = BeautifulSoup(request.text, 'html.parser')
        return soup.select(param)[0].getText().strip()
 
    @classmethod
    def getURL(cls, controllerName):
        return '/api/v_' + config['version'].replace('.', '_') + '/' + controllerName
