import 'package:flutter/material.dart';
import 'package:image_editor/screens/edit_image_screen.dart';
import 'package:image_editor/widget/deafult_button.dart';

abstract class EditImageView extends State<EditImageScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  //creating Dialog
  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('add New Text'),
        content: TextField(
          controller: _textEditingController,
          maxLines: 5,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.edit),
            filled: true,
            hintText: 'Your Text Here...',
          ),
        ),
        actions: [
          DeafultButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.red,
            textColor: Colors.white,
            child: const Text('Cancel'),
          ),
          DeafultButton(
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('add Text'),
          )
        ],
      ),
    );
  }
}
