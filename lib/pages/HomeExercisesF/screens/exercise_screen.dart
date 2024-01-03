import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'exercise_hub.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercises exercises;
  final int seconds;

  ExerciseScreen({required this.exercises, required this.seconds});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool _iscomplete = false;
  int _elapsedSeconds = 0;

  late Timer timer;

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  // dispose timer when screen is changed
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  //play audio when exercise is completed
  void audioplay() {
    audioCache.play("applause.wav");
  }

  @override
  void initState() {
    // Increase timer after every second
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();
        setState(() {
          _iscomplete = true;
          audioplay();
        });
      }

      setState(() {
        _elapsedSeconds = t.tick;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff192a56),
        title: const Text('Stay Fit'),
        centerTitle: true,
      ),

      //  Display exercise gif and elapsed time
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:

                // Create Hero Animation
                Hero(
              tag: widget.exercises.id,
              child: Stack(children: [
                CachedNetworkImage(
                  imageUrl: widget.exercises.gif,
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

                // If exercise is not completed, show the elapsed and remaining time
                _iscomplete != true
                    ? SafeArea(
                        child: Container(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "$_elapsedSeconds / ${widget.seconds} Seconds",
                            style: const TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff5E3C6B),
                                fontFamily: 'Times Roman',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))
                    :

                    // If exercise is completed, show check
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "$_elapsedSeconds / ${widget.seconds} Seconds",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0xff5E3C6B),
                                    fontFamily: 'Times Roman',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                alignment: Alignment.topCenter,
                                child: const Icon(
                                  Icons.check_box_sharp,
                                  color: Color(0xff5E3C6B),
                                )),
                          )
                        ],
                      )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
