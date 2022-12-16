import 'package:flutter/material.dart';
import 'package:image_editor/screens/edit_image_screen.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('upload your Photo to Editing Text '),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          onPressed: () async {
            //pick image from your gallery
            XFile? imageFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);

            if (imageFile != null) {
              //to avoid using context in async gap
              if (!mounted) return;
              //pathing the imageFile to Our Constractour in EditImageScreen to displayit
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditImageScreen(
                    selectedImage: imageFile.path,
                  ),
                ),
              );
            }
          },
          icon: const Icon(Icons.upload_file),
        ),
      ),
    );
  }
}
