from flask import jsonify
from resources.rest_service import config
from worldcecker.configuration.Config import app
from flask_cors import cross_origin
from worldcecker.controller import TimeController, WeatherController

# controllers init
app.register_blueprint(TimeController.time)
app.register_blueprint(WeatherController.weather)


# @endpoint For the first view
@app.route("/", methods=['GET'])
@cross_origin()
def home():
    return jsonify(config)