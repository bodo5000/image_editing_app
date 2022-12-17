import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor/widget/edit_image_view.dart';
import 'package:image_editor/widget/image_text.dart';

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
      appBar: _appBar,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Stack(
            children: [
              _selectedImage,
              for (int i = 0; i < textInfoList.length; i++)
                Positioned(
                  left: textInfoList[i].left,
                  top: textInfoList[i].top,
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        currentIndex = i;
                        removeText(context);
                      });
                    },
                    onTap: () => setCurrentIndex(context, i),
                    child: Draggable(
                      feedback: ImageText(
                        textInfo: textInfoList[i],
                      ),
                      child: ImageText(textInfo: textInfoList[i]),
                      onDragEnd: (drag) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset offset = renderBox.globalToLocal(drag.offset);

                        setState(() {
                          textInfoList[i].top = offset.dy - 96;
                          textInfoList[i].left = offset.dx;
                        });
                      },
                    ),
                  ),
                ),
              creatorText.text.isEmpty
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        creatorText.text,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: _addNewTextFloatingButton,
    );
  }

  AppBar get _appBar => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                tooltip: 'Save Image',
              ),
              IconButton(
                onPressed: increaseFontSize,
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                tooltip: 'Increament FontSize',
              ),
              IconButton(
                onPressed: decreaseFontSize,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                tooltip: 'Decrease FontSize',
              ),
              IconButton(
                onPressed: changeFontWeight,
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.black,
                ),
                tooltip: 'Format',
              ),
              IconButton(
                onPressed: changeFontStyle,
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.black,
                ),
                tooltip: 'Italic',
              ),
              IconButton(
                onPressed: addLiensToText,
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.black,
                ),
                tooltip: 'Add New Line',
              ),
              Tooltip(
                message: 'White Color',
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 50.0,
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => changeTextColor(Colors.white),
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Tooltip(
                message: 'black Color',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.black),
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Tooltip(
                message: 'Red Color',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.red),
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Tooltip(
                message: 'blue Color',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.blue),
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
//will pass the selected image to this screen
  Widget get _selectedImage => Center(
        child: Image.file(
          File(widget.selectedImage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      );

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
