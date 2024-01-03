import 'package:flutter/material.dart';

//import 'dart:async';
import 'package:camera/camera.dart';
import 'package:fitnesstrainer/pages/AIExercisesF/home_screen.dart';
//import 'AIExercisesF/main_screen.dart';

//import 'main_screen.dart';
//import 'home_screen.dart';

List<CameraDescription> cameras = [];

class Exercises1 extends StatefulWidget {
  Exercises1({key}) : super(key: key);

  @override
  State<Exercises1> createState() => _Exercises1State();
}

class _Exercises1State extends State<Exercises1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise page"),
      ),
      body: HomeScreen(cameras),
      //home: MainScreen(cameras),
      // routes: {
      //  MainScreen.id: (context) => MainScreen(cameras),
      //DemoScreen.id: (context) => DemoScreen(),
      //    },
    );
  }
}/*
 home: HomeScreen(cameras),
      //home: MainScreen(cameras),
      routes: {
        MainScreen.id: (context) => MainScreen(cameras),
        //DemoScreen.id: (context) => DemoScreen(),
      },


Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
    );*/
