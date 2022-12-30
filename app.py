from flask import jsonify
from resources.rest_service import config
from flask_cors import cross_origin
from worldcecker.controller import TimeController, WeatherController
from flask import Flask

app = Flask(__name__)

# controllers init
app.register_blueprint(TimeController.time)
app.register_blueprint(WeatherController.weather)


# @endpoint For the first view
@app.route("/", methods=['GET'])
@cross_origin()
def home():
    return jsonify(config)