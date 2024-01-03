import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
// creating List of Slide objects
// to store data of all intro slides
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    // initializing slides at
    // the runtime of app
    var learning;
    slides.add(
      new Slide(
        title: "About Application ",
        maxLineTitle: 2,
        styleTitle: TextStyle(
          color: Colors.green,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "⦁	We have developed Artificial Intelligence based "
            "application that worked as a fitness trainer which"
            " will help users to live healthier & fit life. "
            "In our Application to calculate height we have used"
            " image processing & to detect exercises done by a "
            "user we have used video processing with the help of "
            " Open CV Library. User will get their exercises "
            "according to BMI by their height & weight. Also,"
            " We Have divided BMI into five categories like "
            "Underweight, Normal, Overweight, Obese & Extremely"
            " Obese.",
        styleDescription: TextStyle(
          color: Colors.green,
          fontSize: 20.0,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        backgroundColor: Colors.yellow,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title: "Why this....",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "1. To overcome the Shortage "
            "of gym trainers in India."
            "2. Gym Fees are Ranges from"
            " 1000-3000 per month. "
            "So, many peoples can’t "
            "afford gym costs."
            "3. Peoples are very busy"
            " with their daily schedule, "
            "so they don't have time"
            " to go to the gym. so,"
            " we are just trying to "
            "make it online."
            "4. In the gym Trainers"
            " have to manage many customers "
            "at a time."
            "5. User will get a proper "
            "diet plan according to her BMI.",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        backgroundImage: "assets/image1.png",
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "DEVELOPED BY"
            "EASY FIT",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "Students of NDMVP'S "
            "KBTCOE NASHIK.."
            ""
            ""
            "1.Shubham Thok    "
            "2.Rutvik Sonawane"
            "3.Vaibhav Adke    "
            "4.Abhijeet Pawar",
        styleDescription: TextStyle(
          color: Color.fromARGB(255, 94, 193, 112),
          fontSize: 20.0,
        ),
        backgroundImage: "assets/image2.png",
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: TextButton(
          onPressed: () {},
          child: Text(
            "AI Trainer",
            style: TextStyle(fontSize: 20),
          )),

      // Next button
      renderNextBtn: Icon(
        Icons.navigate_next,
        color: Colors.green,
        size: 40.0,
      ),
      // Done button
      renderDoneBtn: TextButton(
          onPressed: () {},
          child: Text("Done", style: TextStyle(fontSize: 20))),

      // Dot indicator
      colorDot: Colors.green,
      colorActiveDot: Colors.green,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.black,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}











/*import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  AboutApp({key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About This Application"),
      ),
      body: Card(
        child: Container(
          color: Colors.red[300],
          child: Text("Developed by........kbtcoe students  "),
        ),
      ),
    );
  }
}*/
