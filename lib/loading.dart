import 'dart:convert';

import 'package:codewithdhruv/location.dart';
import 'package:codewithdhruv/main.dart';
import 'package:codewithdhruv/worker/worker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import 'package:flutter_spinkit/flutter_spinkit.dart';  


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> { 
  
   void startapp(){ 
     Future.delayed(Duration(seconds: 4),(){
        Navigator.pushReplacementNamed(context, '/home' );
     });
    }

// void startapp() async {
//    String temp ;
//    String wind ;
//    String des ;
//    String humidity ;

//   Models models =  Models(location: "mathura");
//   await models.getdata();
  
//   temp = models.temp;
//   des = models.description;
//   wind = models.air;
//   humidity = models.humidity;
  
//   Future.delayed(Duration(seconds: 4),() {
//     Navigator.pushReplacementNamed(context, '/home',arguments:  {
//     'temp_value' : temp,
//     'hum_value' : humidity,
//     'des_value' : des,
//     'wind_value' : wind,

//   });
//   });
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startapp();
  }
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.blue[200],
        appBar: AppBar(
        title: const Text("Loading APP"),
    ),
    body: Container(

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [
            Image(image: AssetImage("assets/weather.png"),
            height: 150,
            width: 150,
            ),
            SizedBox(height: 15.0,),
            Text("Live Weather",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35 )),
            SizedBox(height: 2.0,),
            Text("By Harsh Verma",style: TextStyle(fontSize: 15 ,)),
            SizedBox(height: 10.0,),
            SpinKitWave(
            color: Colors.white,
            size: 40.0,
            ),
          ],
        ),
      ),
    )
    );
  }
}