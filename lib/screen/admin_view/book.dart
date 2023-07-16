// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:perpustakaan/screen/admin_view/detail.book.dart';
import 'package:perpustakaan/screen/admin_view/tambah_buku.dart';
import 'package:http/http.dart' as http;
import 'package:perpustakaan/model/Buku.dart';
import 'package:perpustakaan/apuUrl.dart';
import 'package:perpustakaan/screen/admin_view/update_book.dart';

class BookPage extends StatefulWidget {
  final Buku? book;

  BookPage({this.book});
  @override
  BookPageState createState() => BookPageState();
}

class BookPageState extends State<BookPage> {
  late Future<List<Buku>?> listBook;
  final listBookKey = GlobalKey<BookPageState>();

  @override
  void initState() {
    listBook = getBookList();
    super.initState();
    // Panggil fungsi untuk mengambil data dari API saat widget diinisialisasi
  }

  Future<List<Buku>?> getBookList() async {
    final response = await http.get(
      Uri.parse("${apiUrl.basicUrl}/list.php"),
      headers: {"Accept": "application/json; charset=UTF-8"},
    );
    print(response.body);
    if (response.statusCode == 200) {
      List<Buku> bukuFromJson(String str) =>
          List<Buku>.from(jsonDecode(str).map((items) => Buku.fromJson(items)));

      return bukuFromJson(response.body);
    } else {
      print("Error Status: ${response.statusCode}");
      throw Exception('Failed to load data');
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
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 50, 64, 106),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),

                // Text Dalam Widget
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 30, bottom: 10),
                    child: Text(
                      "Book",
                      style: TextStyle(
                        fontFamily: 'Poppins Bold',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // Image Cari
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Image.asset("assets/duduk_baca.png"),
                ),
              ),

              // Form Cari
              Container(
                padding: EdgeInsets.only(left: 30, right: 200, top: 190),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: TextField(
                  cursorColor: Color.fromARGB(255, 50, 64, 106),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Search',
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
            ],
          ),

          // Button Add Book
          Container(
            padding: EdgeInsets.only(
              left: 30,
              right: 200,
            ),
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TambahPage(),
                  ),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 50, 64, 106),
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Add Book",
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 64, 106),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),
          SafeArea(
            child: FutureBuilder<List<Buku>?>(
              future: listBook,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Buku>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            data.judul.toString(),
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 64, 106),
                              fontFamily: 'Poppins Bold',
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            data.penulis.toString(),
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 64, 106),
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                          leading: Icon(
                            Icons.book_sharp,
                            color: Color.fromARGB(255, 50, 64, 106),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => UpdatePage(
                                    book: data,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit_document),
                            color: Color.fromARGB(255, 50, 64, 106),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  book: data,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Failed to load data: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: Text('No data available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
