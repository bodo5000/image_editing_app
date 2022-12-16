import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor/widget/edit_image_view.dart';

class EditImageScreen extends StatefulWidget {
  //we will pass imagefile in HomeScreen to this selectedImage to display it on our EditImageScreen
  final String selectedImage;
  const EditImageScreen({super.key, required this.selectedImage});

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

// make class extends EditImageView that extend From State<EditImageScreen> to have all Methods of State plus EditImageView Mehods
class _EditImageScreenState extends EditImageView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(
        File(
          widget.selectedImage,
        ),
      ),
      floatingActionButton: _addNewTextFloatingButton,
    );
  }

  Widget get _addNewTextFloatingButton => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      );
}
