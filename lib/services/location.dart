import 'package:geolocator/geolocator.dart';


class Location {
  String latitude;
  String longitude;

  Future<void> getLocation() async {   
    // print("started")     ;
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      longitude = position.longitude.toString();
      latitude = position.latitude.toString();
      print("future $longitude $latitude");
    }
    catch(e){ 
      print(e);
    }
  }
}