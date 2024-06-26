import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const host = 'api.openweathermap.org';
const route = 'data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var queryParams = {
      'q': cityName,
      'appid': '82702eaddca32637098601bf905fcd95',
      'units': 'metric'
    };
    NetworkHelper networkHelper = NetworkHelper(host, route, queryParams);
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var queryParams = {
      'lat': '${location.latitude}',
      'lon': '${location.longitude}',
      'appid': '82702eaddca32637098601bf905fcd95',
      'units': 'metric'
    };
    NetworkHelper networkHelper = NetworkHelper(host, route, queryParams);
    var data = await networkHelper.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
