/*import 'package:flutter/material.dart';

class TrainerContact extends StatefulWidget {
  TrainerContact({key}) : super(key: key);

  @override
  State<TrainerContact> createState() => _TrainerContactState();
}

class _TrainerContactState extends State<TrainerContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trainers Contact")),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

class TrainerContact extends StatefulWidget {
  @override
  _TrainerContactState createState() => _TrainerContactState();
}

class _TrainerContactState extends State<TrainerContact> {
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
        title: "Gyme Trainers  ",
        maxLineTitle: 2,
        styleTitle: TextStyle(
          color: Color.fromARGB(255, 42, 23, 171),
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "hello there, "
            "you can contact to following trainers,"
            "only for query related to Gyme training"
            " Tariner 1 : Vaibhav Adke [1111111111]"
            " Tariner 2 : Vaibhav Adke [1111111111]"
            " Tariner 3 : Vaibhav Adke [1111111111]"
            " Tariner 4 : Vaibhav Adke [1111111111]",
        styleDescription: TextStyle(
          color: Color.fromARGB(255, 70, 192, 75),
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
        title: "Yoga Trainers",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "hello there, "
            "you can contact to following trainers,"
            "only for query related to yoga training"
            " Tariner 1 : Vaibhav Adke [1111111111]"
            " Tariner 2 : Vaibhav Adke [1111111111]"
            " Tariner 3 : Vaibhav Adke [1111111111]"
            " Tariner 4 : Vaibhav Adke [1111111111]",
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
        title: "Meditation Trainers",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "hello there, "
            "you can contact to following trainers,"
            "only for query related to Meditation training"
            " Tariner 1 : Vaibhav Adke [1111111111]"
            " Tariner 2 : Vaibhav Adke [1111111111]"
            " Tariner 3 : Vaibhav Adke [1111111111]"
            " Tariner 4 : Vaibhav Adke [1111111111]",
        styleDescription: TextStyle(
          color: Colors.white,
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
            "Skip",
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








/*

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:intl/intl.dart';



class MyHomePage extends StatefulWidget {
MyHomePage({Key key, this.title}) : super(key: key);

// This widget is the home page of your application. It is stateful, meaning
// that it has a State object (defined below) that contains fields that affect
// how it looks.

// This class is the configuration for the state. It holds the values (in this
// case the title) provided by the parent (in this case the App widget) and
// used by the build method of the State. Fields in a Widget subclass are
// always marked "final".

final String title;

@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(
        fileJson: "assets/service.json")
        .build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });


    print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
   }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat bot",
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text("Today, ${DateFormat("Hm").format(DateTime.now())}", style: TextStyle(
                fontSize: 20
              ),),
            ),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            SizedBox(
              height: 20,
            ),

            Divider(
              height: 5.0,
              color: Colors.greenAccent,
            ),
            Container(


              child: ListTile(

                  leading: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.greenAccent, size: 35,),
                  ),

                  title: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                          15)),
                      color: Color.fromRGBO(220, 220, 220, 1),
                    ),
                    padding: EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: messageInsert,
                      decoration: InputDecoration(
                        hintText: "Enter a Message...",
                        hintStyle: TextStyle(
                            color: Colors.black26
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),

                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      ),
                      onChanged: (value) {

                      },
                    ),
                  ),

                  trailing: IconButton(

                      icon: Icon(

                        Icons.send,
                        size: 30.0,
                        color: Colors.greenAccent,
                      ),
                      onPressed: () {

                        if (messageInsert.text.isEmpty) {
                          print("empty message");
                        } else {
                          setState(() {
                            messsages.insert(0,
                                {"data": 1, "message": messageInsert.text});
                          });
                          response(messageInsert.text);
                          messageInsert.clear();
                        }
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      }),

              ),

            ),

            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),

      child: Row(
          mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [

            data == 0 ? Container(
              height: 60,
              width: 60,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/robot.jpg"),
              ),
            ) : Container(),

        Padding(
        padding: EdgeInsets.all(10.0),
        child: Bubble(
            radius: Radius.circular(15.0),
            color: data == 0 ? Color.fromRGBO(23, 157, 139, 1) : Colors.orangeAccent,
            elevation: 0.0,

            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                      child: Container(
                        constraints: BoxConstraints( maxWidth: 200),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
            )),
      ),


            data == 1? Container(
              height: 60,
              width: 60,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/default.jpg"),
              ),
            ) : Container(),

          ],
        ),
    );
  }
}*/
