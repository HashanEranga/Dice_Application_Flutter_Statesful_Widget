import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text("Dice Application"),
          ),
        ),
        body: DicePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceLeftFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      if (leftDiceNumber > 6) {
        leftDiceNumber = 1;
      }
      print('Left Dice number = $leftDiceNumber');
    });
  }

  void changeDiceRightFace() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      if (rightDiceNumber > 6) {
        rightDiceNumber = 1;
      }
      print('Right Dice Number = $rightDiceNumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeDiceLeftFace();
                },
                child: Image.asset('lib/images/Alea_$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeDiceRightFace();
                },
                child: Image.asset('lib/images/Alea_$rightDiceNumber.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
