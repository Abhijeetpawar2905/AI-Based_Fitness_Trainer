import 'dart:convert';

import 'package:fitnesstrainer/pages/HomeExercisesF/screens/exercise_hub.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'exercise_start_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get data from Json
  Uri apiURL = Uri.parse(
      'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json');
  var decodedjson;

  @override
  void initState() {
    getExercises();
    super.initState();
  }

  // decode json data
  void getExercises() async {
    var response = await http.get(apiURL);
    var body = response.body;
    decodedjson = jsonDecode(body);

    setState(() {
      decodedjson = jsonDecode(body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff192a56),
        title: const Text('Stay Fit'),
        centerTitle: true,
      ),
      body: Container(
        child: decodedjson != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseStartScreen(
                                    exercises: ExerciseHub.fromJson(decodedjson)
                                        .exercises[index],
                                  )));
                    },
                    child: Hero(
                      tag:
                          ExerciseHub.fromJson(decodedjson).exercises[index].id,
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child:

                                  // Fadein image before getting the thumbnail
                                  FadeInImage(
                                placeholder:
                                    const AssetImage('assets/placeholder.jpg'),
                                image: NetworkImage(
                                    ExerciseHub.fromJson(decodedjson)
                                        .exercises[index]
                                        .thumbnail),
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Show Gradient
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF000000),
                                        Color(0x00000000)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center),
                                ),
                              ),
                            ),

                            // Show exercises title
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                ExerciseHub.fromJson(decodedjson)
                                    .exercises[index]
                                    .title,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: ExerciseHub.fromJson(decodedjson).exercises.length)
            :

            // If data is yet to be fetched
            const LinearProgressIndicator(),
      ),
    );
  }
}
