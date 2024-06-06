// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perpustakaan/core.dart';
import 'package:perpustakaan/apuUrl.dart';
import 'package:perpustakaan/model/Buku.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({super.key});
  final Buku? book;

  DetailPage({this.book});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void deleteBook(context) async {
    http.Response response = await http.post(
      Uri.parse("${apiUrl.basicUrl}/delete.php"),
      headers: {"Accept": "application/json; charset=UTF-8"},
      body: {
        'id': widget.book!.id.toString(),
      },
    );
    if (response.statusCode == 200) {
    } else {
      print("Error status ${response.statusCode}");
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookPage()),
    );
    print('Status 200');
    Fluttertoast.showToast(
        msg: "Delete Successfull",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Yakin mau Hapus Data Deckk??'),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Color.fromARGB(255, 180, 126, 152),
                ),
              ),
              child: Icon(
                Icons.cancel_presentation_rounded,
                color: Colors.green,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Color.fromARGB(255, 180, 126, 152),
                ),
              ),
              child: Icon(
                Icons.check_box_outlined,
                color: Colors.red,
              ),
              onPressed: () => deleteBook(context),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 50, 64, 106),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),

            // Text Dalam Widget
            child: ListView(
              children: [
                // Button Back
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.only(right: 20),
                        child: IconButton(
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: () => confirmDelete(context),
                          icon: Icon(Icons.delete_outline_rounded),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 45,
                ),

                // Text Add Book
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Details Book",
                    style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Text(
              "Cover :",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Bold',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Image.network(
                "${apiUrl.basicUrl}/perpustakaan/buku/uploads/${widget.book!.cover}"),
          ),
          SizedBox(
            height: 30,
          ),

          // Widget Title
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Text(
              "Title :",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Bold',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "${widget.book!.judul}",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 50, 64, 106),
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // Widget Author
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Text(
              "Author :",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Bold',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "${widget.book!.penulis}",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 50, 64, 106),
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // Widget Page
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Text(
              "Page :",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Bold',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "${widget.book!.halaman}",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 50, 64, 106),
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // Widget Summary
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Text(
              "Summary :",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Bold',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "${widget.book!.sinopsis}",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 50, 64, 106),
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // Widget Content
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Text(
              "Content :",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Bold',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "${widget.book!.isi}",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 50, 64, 106),
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // Widget Category
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Text(
              "Category :",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Bold',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "${widget.book!.kategori}",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 50, 64, 106),
                fontFamily: 'Poppins',
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
