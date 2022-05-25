import 'dart:convert';

import 'package:http/http.dart';
class Models
{
  late String location;

  Models({required this.location}){
     location = location;
  }


  late String temp;
  late String humidity;
  late String air;
  late String description;

 

  Future<void>  getdata() async{
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=agra&appid=8447a5dc57a5338ec01ba26eba9ee040");
    Response response = await get(url);
    var data =  jsonDecode(response.body);
    Map maindata = data["main"];
    // temp,humidity
    double gettemp = maindata["temp"] ;
    
    int gethumidity = maindata["humidity"];
    
    // speed wind.
    Map winddata = data["wind"];
    double getwinddata = winddata["speed"]; 
    
    // description
    List weather = data["weather"];
    Map weather2 = weather[0];
    String getweather = weather2["description"];
    


 temp = gettemp.toString();
 humidity = gethumidity.toString();
 air = getwinddata.toString();
 description = getweather;
    
  }}