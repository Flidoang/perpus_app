// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
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
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.only(right: 30, bottom: 10),
                    child: Text(
                      "Search",
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
              Container(
                // padding: EdgeInsets.only(bottom: 20),
                child: Image.asset("assets/cari.png"),
              ),
            ],
          ),

          // TextField Untuk Cari
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
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
                fillColor: Colors.grey[150],
                // Icon
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {},
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[800]),
                contentPadding: EdgeInsets.fromLTRB(30, 15, 10, 15),
              ),
              style: TextStyle(
                color: Color.fromARGB(255, 50, 64, 106),
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
          ),

          // Space antara search dan category
          SizedBox(
            height: 40,
          ),

          // Text Category
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Category",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontFamily: 'Poppins Bold',
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Button Pemesanan Potong
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => potongPage()),
                  // );
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 64, 106),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Gambar Komputer
                      Image.asset(
                        "assets/computer.png",
                        height: 55,
                      ),

                      // Text Di Bawah Gambar
                      Text(
                        "Computer\n  Science",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Button Literatur
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => potongPage()),
                  // );
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 64, 106),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Gambar Komputer
                      Image.asset(
                        "assets/buku.png",
                        height: 70,
                      ),

                      // Text Di Bawah Gambar
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text(
                          "Literatur",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Button Pemesanan Creambath
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => potongPage()),
                  // );
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 64, 106),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Gambar Komputer
                      Container(
                        child: Image.asset(
                          "assets/grapich.png",
                          height: 70,
                        ),
                      ),

                      // Text Di Bawah Gambar
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "   Art and\nRecreation",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),

          // Coulum Card Baris Ke - 2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Button card jam
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => potongPage()),
                  // );
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 64, 106),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Gambar Komputer
                      Image.asset(
                        "assets/jam.png",
                        height: 55,
                      ),

                      // Text Di Bawah Gambar
                      Text(
                        "History and\nGeography",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Button Card Bahasa
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => potongPage()),
                  // );
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 64, 106),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Gambar Komputer
                      Image.asset(
                        "assets/bahasa.png",
                        height: 50,
                      ),

                      // Text Di Bawah Gambar
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Language",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Button Pemesanan Creambath
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => potongPage()),
                  // );
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 64, 106),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Gambar Komputer
                      Container(
                        child: Image.asset(
                          "assets/grapich.png",
                          height: 70,
                        ),
                      ),

                      // Text Di Bawah Gambar
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "   Art and\nRecreation",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
