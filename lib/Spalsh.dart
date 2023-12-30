import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ToDo(),), (route) => false);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/todo.jpg",fit: BoxFit.fill),

      ),
    );
  }
}
