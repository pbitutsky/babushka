import 'package:flutter/material.dart';
import 'package:grandma/phrases.dart';
import 'package:speech_bubble/speech_bubble.dart';
import 'bubble_text.dart';
import 'edit_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grandma',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: "Grandma"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  BubbleText _bubbleText;

  @override
  void initState() {
    _bubbleText = BubbleText();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        setState(() => chooseRandomButtonText());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  grandmaPressed(_controller) {
    if (phrases.isEmpty) {
      return;
    }
    if (_controller.isAnimating) {
//      _controller.stop(canceled: true);
    } else if (_controller.status == AnimationStatus.completed) {
      _controller.reset();
    } else {
      _controller.forward();
      _bubbleText.bubbleTextState.setState(() => chooseRandomText());
    }
  }

  @override
  Widget build(BuildContext context) {
//    var fadeTransition = FadeTransition();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(createRoute(EditPage()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new SpeechBubble(
              color: Color(0xFF4CAF50),
              nipLocation: NipLocation.BOTTOM,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _bubbleText
                ],
              ),
            ),
            RotationTransition(
              turns: CurvedAnimation(parent: _controller, curve: Curves.elasticOut),//Tween(begin: 0.0, end: 1.0).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image(image: AssetImage('images/grandma.png')),
              ),
            ),
            RaisedButton(
              child: Text("$buttonText"),
              onPressed: () => grandmaPressed(_controller),
            )
          ],
        ),
      ),
    );
  }
}


