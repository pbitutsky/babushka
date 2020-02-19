

import 'package:flutter/material.dart';
import 'package:grandma/phrases.dart';
import 'package:flutter_selectable_text/flutter_selectable_text.dart' as selectableText;


class NewPhrasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Add a New Phrase")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NewPhraseForm()
    )
    );
  }
}

// Create a Form widget.
class NewPhraseForm extends StatefulWidget {
  @override
  NewPhraseFormState createState() {
    return NewPhraseFormState();
  }
}

class NewPhraseFormState extends State<NewPhraseForm> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: myController
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  phrases.add(myController.text);
                  Navigator.pop(context);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}