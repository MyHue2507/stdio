import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample_for_team/sign_in/sign_in.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }

}


class _SplashState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context) {
     return Container(
       child: Center(child: Text("Welcome to Stdio Hue", style: TextStyle(color: Colors.black),)),
     );
  }
  @override
  void initState() {
      super.initState();
      _wait();
    }

  _wait() async{
     sleep(new Duration(seconds: 3,));
     if (mounted){
       // open other
      Navigator.of(context).pushReplacementNamed("/");
     }
  }

}