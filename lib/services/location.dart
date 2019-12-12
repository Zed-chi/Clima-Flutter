import 'package:geolocator/geolocator.dart';


class Location {
  String latitude;
  String longitude;

  Future<void> getLocation() async {        
    try{
      Position position = await Geolocator().
      getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low
      );
      longitude = position.longitude.toString();
      latitude = position.latitude.toString();
    }
    catch(e){ 
      print(e);
    }
  }
}