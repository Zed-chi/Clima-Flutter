import 'package:flutter/material.dart';
import "../services/location.dart";
import "package:http/http.dart";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {    
    super.initState();
    getLocation();
    getData();
  }


  void getLocation() async {        
    Location location = Location();
    await location.getLocation();
    print(location.latitude);
    print(location.longitude);

  }

  void getData() async {
    Response res = await get("https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appId=e155690e9c5a721192a3d32032c12449");
    if (res.statusCode == 200){
      print(res.body);
    } else{
      print("some error");
    }
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
