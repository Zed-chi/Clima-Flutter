import "package:http/http.dart";
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);

  final String url;
  
  Future getData() async {
    Response res = await get(url);
    if (res.statusCode == 200){
      return jsonDecode(res.body);      
    } else{
      print("some error");
    }
  }
}