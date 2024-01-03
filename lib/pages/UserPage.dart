import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({key, required String name, required String urlImage})
      : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Image"),
      ),
    );
  }
}
