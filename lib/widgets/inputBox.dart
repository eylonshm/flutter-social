import 'package:flutter/material.dart';
import './pages/userProfile.dart';

// Define a custom Form widget.
class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  // Access Value by myController.text
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(16.0),
        width: 300,
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search GitHub User',
          ),
        ),
      ),
      TextButton(
          child: Text('Search'),
          onPressed: () {
            if (myController.text.length > 0) {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return UserProfile(userId: myController.text);
                },
              ));
            } else {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Please enter a valid Username'),
                  content: const Text(
                      'Username should be at least 1 character long.'),
                ),
              );
            }
          })
    ]);
  }
}
