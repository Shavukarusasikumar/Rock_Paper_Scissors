import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Congratulatory Animation'),
        ),
        body: CongratulationScreen(),
      ),
    );
  }
}

class CongratulationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display your congratulatory animation here
          FlareActor(
            "assets/congratulation_animation.flr", // Path to your Flare animation file
            animation: "animation_name", // Replace with the animation name you want to play
          ),
          Text(
            "Congratulations!",
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
