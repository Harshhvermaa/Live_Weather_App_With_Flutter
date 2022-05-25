import 'package:flutter/material.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  


 
  
  @override
  

  Widget build(BuildContext context) {
    ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
         appBar: AppBar(
        title: const Text("Location APP"),
    ),
    body: 
          Text("data"),
          // Text(apidata["temp_value"]),

      
    
    );
  }
}