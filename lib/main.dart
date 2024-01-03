import 'package:flutter/material.dart';
//import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitnesstrainer/FBAuthentication/pages/login.dart';
import 'package:alan_voice/alan_voice.dart';

//for ai align

import 'dart:async';
import 'package:camera/camera.dart';

//C:\flutterprojects\flutter_application_1\lib\pages\AIExercisesF\main_screen.dart
//import 'package:flutter_application_1/pages/AIExercisesF/main_screen';
//import 'main_screen.dart';
//import 'home_screen.dart';
List<CameraDescription> cameras = [];
/*void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}*/
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: unused_field
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: _initialization,
        builder: (context, snapshot) {
      // Check for Errors
      if (snapshot.hasError) {
        print("Something Went Wrong");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      return MaterialApp(
        title: 'AI Trainer',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: Login(),
      );
    });
  }
}

/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/FBAuthentication/pages/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            title: 'Flutter Firebase EMail Password Auth',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            debugShowCheckedModeBanner: false,
            home: Login(),
          );
        });
  }
}
*/
