import 'package:flutter/material.dart';

import '../model.dart';

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {

  final _formKey = GlobalKey<FormState>();
  final _verbrauchController = TextEditingController();



  @override
  void dispose() {
    _verbrauchController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.info_outline),
        title: Text("Formular"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Form(
              key: _formKey,
              child: TextFormField(
                  controller: _verbrauchController,
                  validator: (value) {
                if (value.isEmpty) {
                  return 'Bitte Automarke eingeben';
                }
                return null;
              }
              ),
            )
          ),
          RaisedButton(
            onPressed: () {


              if(_formKey.currentState.validate()) {
                Scaffold
                  .of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('submit'),
          )
        ],
      ),
    );
  }
}



