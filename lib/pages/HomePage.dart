import 'package:flutter/material.dart';
import 'package:fitnesstrainer/widget/drawer.dart';

import 'HomeExercisesF/screens/onboarding_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: OnboardingScreen(),
      // Center(
      //   child: Container(
      //     child: const Text("Welcome to our Fitness Trainee App"),
      //   ),
      // ),
      //  home: OnboardingScreen(),
      drawer: NavigationDrawerWidget(),
    );
  }
}
