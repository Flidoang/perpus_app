import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:perpustakaan/apuUrl.dart';
import 'package:perpustakaan/core.dart';
import 'package:perpustakaan/model/Buku.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_area/text_area.dart';

class UpdatePage extends StatefulWidget {
  final Buku? book;

  UpdatePage({this.book});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  File? _pickedImage;
  var reasonValidation = true;

  final formKey = GlobalKey<FormState>();

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

  Future updateBook(body) async {
    http.Response response = await http.post(
      Uri.parse("${apiUrl.basicUrl}/update.php"),
      body: {
        "id": widget.book!.id.toString(),
        "cover": widget.book!.cover.toString(),
        "judul": widget.book!.judul.toString(),
        "penulis": widget.book!.penulis.toString(),
        "halaman": widget.book!.halaman.toString(),
        "sinopsis": widget.book!.sinopsis.toString(),
        "isi": widget.book!.isi.toString(),
        "kategori": widget.book!.kategori.toString(),
      },
    );

    if (response.statusCode == 200) {
      print('Status 200');
      return true;
    } else {
      return null;
    }
  }

  void _onConfirm(context) async {
    Buku buku = Buku();
    String BukuToJson(Buku data) => json.encode(data.toJson());
    await updateBook(BukuToJson(buku))
        .then((value) => print("Edit Data Success"));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookPage()),
    );
  }

  @override
  void initState() {
    title = TextEditingController(text: widget.book!.judul);
    author = TextEditingController(text: widget.book!.penulis);
    page = TextEditingController(text: widget.book!.halaman.toString());
    summary = TextEditingController(text: widget.book!.sinopsis);
    content = TextEditingController(text: widget.book!.isi);
    category = TextEditingController(text: widget.book!.kategori);
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
                            "Update Book",
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
                  _onConfirm(context);
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
