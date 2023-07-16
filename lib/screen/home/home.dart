// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              // Widget Tampilan User
              Container(
                height: 280,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 50, 64, 106),
                  // border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),

                // Text User
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 50),
                      child: Text(
                        "Hallo,",
                        style: TextStyle(
                          fontFamily: 'Poppins Bold',
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Name User",
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

              // Immage
              Container(
                padding: EdgeInsets.only(top: 30),
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/book_lover.png",
                  height: 300,
                  // width: 350,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          // Text Category & Button See All
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Category",
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),

              // Ini Ribet Tapi Responsive ajg
              Flexible(
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.only(right: 30),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontFamily: 'Poppins Bold',
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          // Card List Konten
          // Button Computer
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

          // Jarak antara card ke text
          SizedBox(
            height: 30,
          ),

          // Text Recomended
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Recommended For You",
              style: TextStyle(
                fontFamily: 'Poppins Bold',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
