import "./location.dart";
import './networking.dart';

const apiKey = "e155690e9c5a721192a3d32032c12449";
const openWeatherUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  Future<dynamic> getCityWeather(String city)async {
      var url = '$openWeatherUrl?q=$city&units=metric&appId=$apiKey';
      NetworkHelper nethelper = NetworkHelper(url);
      return await nethelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();    
    NetworkHelper nethelper = NetworkHelper(
      "$openWeatherUrl?units=metric&lat=${location.latitude}&lon=${location.longitude}&appId=$apiKey"
    );
    var jsonData = await nethelper.getData();
    return jsonData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'i1';
    } else if (condition < 400) {
      return 'i2';
    } else if (condition < 600) {
      return 'i☔️';
    } else if (condition < 700) {
      return 'i☃️';
    } else if (condition < 800) {
      return 'i3';
    } else if (condition == 800) {
      return 'i☀️';
    } else if (condition <= 804) {
      return 'i☁️';
    } else {
      return 'i4';
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
