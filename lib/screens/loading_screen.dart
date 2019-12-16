import 'package:flutter/material.dart';
import "../services/location.dart";
import '../services/networking.dart';
import "./location_screen.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
const apiKey = "e155690e9c5a721192a3d32032c12449";

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
    Location location = Location();
    await location.getLocation();
    lat = double.parse(location.latitude);
    lon = double.parse(location.longitude);

    NetworkHelper nethelper = NetworkHelper(
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appId=$apiKey"
    );
    var jsonData = await nethelper.getData();

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder:(context){return LocationScreen(locationWeather: jsonData,);} 
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
