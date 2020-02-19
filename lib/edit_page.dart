

import 'package:flutter/material.dart';
import 'package:grandma/phrases.dart';
import 'package:flutter_selectable_text/flutter_selectable_text.dart' as selectableText;

import 'new_phrase_page.dart';

class EditPage extends StatefulWidget {

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(String phrase, int index, context) {

    return Dismissible(
        key: Key(phrase),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          setState(() {
            phrases.removeAt(index);
          });
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Phrase deleted")));
        },
        background: Container(color: Colors.red),
        child: ListTile(

          title: selectableText.SelectableText(
              phrase,
              style: _biggerFont
          ),
          trailing: Icon(
              Icons.delete,
              color: Colors.red
          ),
        )
    );

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Grandma's Phrases")),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(createRoute(NewPhrasePage()));
        },
      ),
      body: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, i) {
              if (i.isOdd) return Divider();
              final index = i ~/ 2;
              return _buildRow(phrases[index], index, context);
            },
            itemCount: phrases.length*2,
          )
      ),
    );
  }
}

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
