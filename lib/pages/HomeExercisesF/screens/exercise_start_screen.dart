import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnesstrainer/pages/HomeExercisesF/screens/exercise_hub.dart';
import 'package:fitnesstrainer/pages/HomeExercisesF/screens/exercise_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../Exercises1.dart';
//import 'package:fitnesstrainer/pages/Exercises.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;

  ExerciseStartScreen({required this.exercises});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff192a56),
        title: const Text('Stay Fit'),
        centerTitle: true,
      ),
      body:

          // To prvide custom height and width
          Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Hero(
            tag: widget.exercises.id,
            child: Stack(
              children: [
                // Show placeholder till the image is fetched
                CachedNetworkImage(
                  imageUrl: widget.exercises.thumbnail,
                  placeholder: (context, url) => Image(
                    image: const AssetImage('assets/placeholder.jpg'),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),

                // To show timer at the bottom of the screen
                Positioned.fill(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: SleekCircularSlider(
                        appearance: const CircularSliderAppearance(
                            animationEnabled: true),
                        initialValue: 30,
                        max: 60,
                        min: 2,

                        // Customize inner widget
                        innerWidget: (v) {
                          return Center(
                            child: Text("${v.toInt()} Sec",
                                style: const TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: Color(0xff5E3C6B),
                                  fontSize: 25.0,
                                )),
                          );
                        },
                        onChange: (double v) {
                          seconds = v.toInt();
                        },
                      ),
                    )),

                // Start Button
                Container(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExerciseScreen(
                                      exercises: widget.exercises,
                                      seconds: seconds)));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff5B54FA),
                        ),
                        child: const Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )

            /* FadeInImage(
            image: NetworkImage(widget.exercises.thumbnail),
            placeholder: AssetImage('assets/placeholder.jpg'),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width ,


          ), */
            ),
      ),
    );
  }
}
