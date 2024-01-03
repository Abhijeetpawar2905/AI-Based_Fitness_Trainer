import 'package:fitnesstrainer/pages/HomeExercisesF/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

// A list of three screens shown as a brief introduction

var pages = [
  PageViewModel(
      title: "Stay fit with our tips!",
      body:
          "get in shape and follow the tutorials, make sure to complete your timer",
      image: Center(
        child: Image.asset("assets/screen1nobg.png", height: 250.0),
      ),
      decoration: const PageDecoration(
          pageColor: Color(0xff192a56),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.0),
          bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18.0))),
  PageViewModel(
      title: "Exercise Now!",
      body:
          "Need motivation? We got you covered! Complete your time to get your applause from the audience",
      image: Center(
        child: Image.asset("assets/screen2nobg.png", height: 200.0),
      ),
      decoration: const PageDecoration(
          pageColor: Color(0xff192a56),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.0),
          bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18.0))),
  PageViewModel(
      title: "Let's start",
      body: "What are you waiting for? Start exercise today",
      image: Center(
        child: Image.asset("assets/screen3nobg.png", height: 200.0),
      ),
      decoration: const PageDecoration(
          pageColor: Color(0xff192a56),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.0),
          bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18.0)))
];

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: const Color(0xff192a56),
        pages: pages,
        onDone: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
          // When done button is press
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: true,
        skip: const Icon(
          Icons.skip_next,
          color: Colors.white,
        ),
        next: const Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
        done: const Text("Done",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.amber,
            color: Colors.white,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
