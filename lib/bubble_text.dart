import 'dart:math';

import 'package:flutter/material.dart';

var phrases = [
  "It's because you walk around without your slippers.",
  "It's because you don't dry your hair when you go outside.",
  "It's because you drink cold water with your dinner!",
  "It's because you don't wear your jacket when it's cold!",
  "It's because you sleep with wet hair!",
  "It's because you never listen to your grandma!"
];

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