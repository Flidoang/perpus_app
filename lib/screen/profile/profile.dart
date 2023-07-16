// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perpustakaan/auth/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _pickedImage;
  File? _captureImage;

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Lakukan sesuatu dengan gambar yang dipilih, seperti menampilkannya atau mengunggahnya.
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _takeImageWithCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // Lakukan sesuatu dengan gambar yang diambil, seperti menampilkannya atau mengunggahnya.
      setState(() {
        _captureImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 50, 64, 106),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "PROFILE",
                      style: TextStyle(
                        fontFamily: 'Poppins Bold',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 500,
                margin: EdgeInsets.only(top: 120),
                padding: EdgeInsetsDirectional.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/profile.png",
                  ),
                  radius: 80,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),

          // Text
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "My Profile",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          // Text
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Notifications",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Text(
              "Books",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            child: ElevatedButton(
              onPressed: _getImageFromGallery,
              child: Icon(Icons.image),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            height: 250,
            decoration: BoxDecoration(
                // border: Border.all(width: 1),
                ),
            child: _pickedImage != null
                ? Image.file(_pickedImage!, fit: BoxFit.cover)
                : Text('Tidak ada gambar dipilih'),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            child: ElevatedButton(
              onPressed: _takeImageWithCamera,
              child: Icon(Icons.camera_alt_outlined),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            height: 250,
            decoration: BoxDecoration(
                // border: Border.all(width: 1),
                ),
            child: _captureImage != null
                ? Image.file(_captureImage!, fit: BoxFit.cover)
                : Text('Tidak ada gambar dipilih'),
          ),

          SizedBox(
            height: 50,
          ),

          // Button Logout
          Container(
            padding: EdgeInsets.symmetric(horizontal: 180),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
