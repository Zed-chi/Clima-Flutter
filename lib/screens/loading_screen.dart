import 'package:flutter/material.dart';
import "../services/weather.dart";
import "./location_screen.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double lat;
  double lon;
  
  @override
  void initState() {    
    super.initState();
    getLocationData();
  }

  void getLocationData() async {        
    WeatherModel wmodel = WeatherModel();
    var wData = await  wmodel.getLocationWeather();
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder:(context){return LocationScreen(locationWeather: wData);} 
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        )
      ),
    );
  }
}
