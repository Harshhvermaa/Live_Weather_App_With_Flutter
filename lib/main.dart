import 'package:codewithdhruv/loading.dart';
import 'package:codewithdhruv/location.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

void main(List<String> args) {
  runApp( MaterialApp(
    
    routes: {
      "/" :(context) =>  Loading(),
      "/home" :(context) =>  HomeScreen(),
      "/Location" :(context) =>  Location(),
      "/Loading" :(context) =>  Loading()
    },
  ));
}