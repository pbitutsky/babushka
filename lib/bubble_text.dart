import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grandma/phrases.dart';



final initialTextInBubble = "Hi sweetie, how are you?";

class BubbleText extends StatefulWidget {
  State bubbleTextState;
  @override
  State<StatefulWidget> createState() {
    bubbleTextState = new BubbleTextState();
    return bubbleTextState;
  }
}

String textInBubble;
var currentIndex = -1;

void chooseRandomText() {
  final _random = new Random();
  var randomIndex = _random.nextInt(phrases.length);
  while (randomIndex == currentIndex) {
    randomIndex = _random.nextInt(phrases.length);
  }
  currentIndex = randomIndex;
  textInBubble = phrases[currentIndex];
}

class BubbleTextState extends State<BubbleText> with TickerProviderStateMixin {

  @override
  void initState() {
    textInBubble = initialTextInBubble;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.8;

    return new Container (
      padding: const EdgeInsets.all(16.0),
      width: c_width,
      child: new Column (
        children: <Widget>[
          new Text (textInBubble, textAlign: TextAlign.center, textScaleFactor: 1.3),
        ],
      ),
    );
  }

}