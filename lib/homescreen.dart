// ignore_for_file: deprecated_member_use

import 'package:codewithdhruv/loading.dart';
import 'package:codewithdhruv/worker/worker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   var temp ;
   var tempdata;
   var wind ;
   var des ;
   var humidity ;
   var icon;
   var icondata;
  
   Future getweather() async {
      var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=agra&appid=8447a5dc57a5338ec01ba26eba9ee040");
      Response response = await get(url);
      var data = jsonDecode(response.body);
      

      setState(() {
        // icon = data['weather']['icon'];
        temp = data['main']['temp'];
        tempdata = (temp - 274).toString();
        wind = data['wind']['speed'];
        icon = data['weather'][0]['icon'];
        icondata = icon.toString();
        des = data['weather'][0]['description'];
        humidity = data['main']['humidity'];
      });
      print(icondata);
      // print(wind);
      // print(des);
      // print(humidity);
   }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getweather();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: SafeArea(
            child: Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Color.fromARGB(255, 212, 212, 212)),
              child: Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Any City Name...",
                      border: InputBorder.none,
                    ),
                  ))
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Color.fromARGB(255, 212, 212, 212)),
                  padding: EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      Image.network('http://openweathermap.org/img/wn/$icondata@2x.png' ),
                      Text(des.toString() + '\n' + 'in Agra' ,style: TextStyle(fontSize: 30),
                ),
                    ],
                  )),
              ),
            ],
          ),
           Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Color.fromARGB(255, 212, 212, 212)),
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.thermostat,size: 40,),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text((tempdata.toString()).substring(0,4),style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),  ),
                          ],
                        ),
                      )
                    ],
                  ),
                  
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container( 
                  margin: EdgeInsets.only(top: 10 ,  right: 10.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color.fromARGB(255, 212, 212, 212)),
                    
                    padding: EdgeInsets.all(10.0),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wind_power,size: 30,),
                          Text("Wind Speed",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: [
                            Text(wind.toString(),style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  ),
                            
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" km/h",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),  ),
                        ],
                      ),
                    ],
                  ),
                  ),
              ),
                Expanded(
                  child: Container( margin: EdgeInsets.only(top: 10 , left: 10.0 ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color.fromARGB(255, 212, 212, 212)),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.water_drop_rounded ,size: 30,),
                          Text("Humidity",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(humidity.toString(),style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  ),
                          ],
                        ),
                      ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Percent",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                         ],
                       ),
                    ],
                  ),
                  ),
                ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
          Text("Live Weather",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
          Text("Data By : OpenWeatherMap",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)

        ],
      ),
    )));
  }
}
