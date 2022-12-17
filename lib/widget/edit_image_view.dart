import 'package:flutter/material.dart';
import 'package:image_editor/models/text_info_model.dart';
import 'package:image_editor/screens/edit_image_screen.dart';
import 'package:image_editor/widget/deafult_button.dart';

abstract class EditImageView extends State<EditImageScreen> {
  //it will pass into our text in TextInfo()
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController creatorText = TextEditingController();

  //initialize list To add texts
  final List<TextInfo> textInfoList = [];

  int currentIndex = 0;
  //select the Text of textInfoList.text
  setCurrentIndex(BuildContext context, int index) {
    setState(() {
      currentIndex = index;
    });

//make sure The Text of textInfoList.text has been Selected
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Text has been Selected to Stlye it',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }

//change Text Color of textInfoList.text
  changeTextColor(Color color) {
    setState(() {
      textInfoList[currentIndex].color = color;
    });
  }

  //increase fontSize of textInfoList.text
  increaseFontSize() {
    setState(() {
      if (textInfoList.isNotEmpty) {
        textInfoList[currentIndex].fontSize += 2;
      }
    });
  }

//decrease fontSize of textInfoList.text
  decreaseFontSize() {
    setState(() {
      if (textInfoList.isNotEmpty) {}
      textInfoList[currentIndex].fontSize -= 2;
    });
  }

  //change font weight
  changeFontWeight() {
    setState(() {
      if (textInfoList.isNotEmpty) {
        if (textInfoList[currentIndex].fontWeight == FontWeight.bold) {
          textInfoList[currentIndex].fontWeight = FontWeight.normal;
        } else {
          textInfoList[currentIndex].fontWeight = FontWeight.bold;
        }
      }
    });
  }

  //change font style
  changeFontStyle() {
    setState(() {
      if (textInfoList.isNotEmpty) {
        if (textInfoList[currentIndex].fontStyle == FontStyle.normal) {
          textInfoList[currentIndex].fontStyle = FontStyle.italic;
        } else {
          textInfoList[currentIndex].fontStyle = FontStyle.normal;
        }
      }
    });
  }

  //wrap in to new line
  addLiensToText() {
    setState(() {
      if (textInfoList.isNotEmpty) {
        if (textInfoList[currentIndex].text.contains('\n')) {
          textInfoList[currentIndex].text =
              textInfoList[currentIndex].text.replaceAll('\n', ' ');
        } else {
          textInfoList[currentIndex].text =
              textInfoList[currentIndex].text.replaceAll(' ', '\n');
        }
      }
    });
  }

//remove Text
  removeText(BuildContext context) {
    setState(() {
      textInfoList.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Text has been Deleted',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }

  //creating addNewText that will add into photo
  addNewText(BuildContext context) {
    setState(
      () {
        textInfoList.add(
          TextInfo(
            text: textEditingController.text,
            left: 0,
            top: 0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            textAlign: TextAlign.left,
          ),
        );
      },
    );

    Navigator.of(context).pop();
  }

  //creating Dialog for editing Text
  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('add New Text'),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.edit),
            filled: true,
            hintText: 'Your Text Here...',
          ),
        ),
        actions: [
          DeafultButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.red,
            textColor: Colors.white,
            child: const Text('Cancel'),
          ),
          DeafultButton(
            onPressed: () {
              addNewText(context);
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('add Text'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
