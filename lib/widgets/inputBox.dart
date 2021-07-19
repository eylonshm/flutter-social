import 'package:flutter/material.dart';

// Define a custom Form widget.
class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

//Input Define a corresponding State class.
// This class holds the data related to the Form.
class _InputFormState extends State<InputForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  // Access Value by myController.text
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
    );
  }
}
