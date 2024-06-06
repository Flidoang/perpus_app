// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perpustakaan/apuUrl.dart';
import 'package:perpustakaan/core.dart';
import 'package:text_area/text_area.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class TambahPage extends StatefulWidget {
  const TambahPage({super.key});

  @override
  State<TambahPage> createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {
  File? _pickedImage;
  var reasonValidation = true;
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController page = TextEditingController();
  TextEditingController summary = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController category = TextEditingController();

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
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  void _submitForm() {
    // Proses pengiriman formulir
    title.clear(); // Membersihkan nilai teks TextField
    author.clear(); // Membersihkan nilai teks TextField
    page.clear(); // Membersihkan nilai teks TextField
    summary.clear(); // Membersihkan nilai teks TextField
    content.clear(); // Membersihkan nilai teks TextField
    category.clear(); // Membersihkan nilai teks TextField
    setState(() {
      _pickedImage = null!;
    }); // Membersihkan nilai teks TextField
  }

  Future create(File? imageFile) async {
    var url = Uri.parse('${apiUrl.basicUrl}/create.php');
    var request = http.MultipartRequest("POST", url);
    request.fields['judul'] = title.text;
    request.fields['penulis'] = author.text;
    request.fields['halaman'] = page.text;
    request.fields['sinopsis'] = summary.text;
    request.fields['isi'] = content.text;
    request.fields['kategori'] = category.text;
    request.files
        .add(await http.MultipartFile.fromPath("cover", imageFile!.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Add Book Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 64, 106),
                    // border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),

                  // Widget di dalam Container
                  child: Column(
                    children: [
                      // Button Back
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: IconButton(
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),

                      // Text Add Book
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 30,
                          ),
                          child: Text(
                            "Add Book",
                            style: TextStyle(
                              fontFamily: 'Poppins Bold',
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // image
                Container(
                  padding: EdgeInsets.only(top: 45),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/duduk_baca.png",
                    ),
                  ),
                ),
              ],
            ),

            // Text Cover Book
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Cover Book",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              // padding: EdgeInsets.symmetric(horizontal: 20),
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                  // border: Border.all(width: 1),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey,
                  //     offset: Offset(3, 3),
                  //     blurRadius: 4,
                  //     spreadRadius: 0,
                  //   ),
                  // ],
                  ),
              child: _pickedImage != null
                  ? Image.file(_pickedImage!, fit: BoxFit.cover)
                  : Text('Tidak ada gambar dipilih'),
            ),

            SizedBox(
              height: 10,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 60),
                child: Text(
                  "Input Image :",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Button Select Image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 170,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 50, 64, 106),
                    ),
                    onPressed: _getImageFromGallery,
                    child: Icon(Icons.image),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 170,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 50, 64, 106),
                    ),
                    onPressed: _takeImageWithCamera,
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            // Text Title
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Title",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // Text Field Title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: TextField(
                controller: title,
                cursorColor: Color.fromARGB(255, 50, 64, 106),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 50, 64, 106),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Input Title..',
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 50, 64, 106),
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // Text Page
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Page",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // TextField Author
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: TextField(
                controller: page,
                cursorColor: Color.fromARGB(255, 50, 64, 106),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 50, 64, 106),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Input Page..',
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 50, 64, 106),
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // Text Page
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Author",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // TextField Author
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: TextField(
                controller: author,
                cursorColor: Color.fromARGB(255, 50, 64, 106),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 50, 64, 106),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Input Author..',
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 50, 64, 106),
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // Text Summary
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Summary",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // TextArea Summary
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.white,
              //   ),
              // ),
              child: TextArea(
                textEditingController: summary,
                validation: reasonValidation,
                errorText: 'Please type a reason!',
                borderRadius: 10,
                borderColor: Color.fromARGB(255, 50, 64, 106),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Content",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.white,
              //   ),
              // ),
              child: TextArea(
                textEditingController: content,
                validation: reasonValidation,
                errorText: 'Please type a reason!',
                borderRadius: 10,
                borderColor: Color.fromARGB(255, 50, 64, 106),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // Text category
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Category",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // TextField Author
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: TextField(
                controller: category,
                cursorColor: Color.fromARGB(255, 50, 64, 106),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 50, 64, 106),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Input Category..',
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 50, 64, 106),
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            SizedBox(
              width: 300,
              height: 40,
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 50, 64, 106)),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Colors.black, // Warna outline
                      width: 0.3, // Ketebalan outline
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Radius sudut
                    ),
                  ),
                ),
                onPressed: () {
                  create(_pickedImage);
                  _submitForm();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 20,
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
      ),
    );
  }
}
