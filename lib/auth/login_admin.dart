// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perpustakaan/apuUrl.dart';
import 'package:perpustakaan/auth/login.dart';
import 'package:perpustakaan/screen/admin_view/book.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = Uri.parse('${apiUrl1.basicUrl}/login.php');
    var response = await http
        .post(url as Uri, body: {"username": user.text, "password": pass.text});
    var data = json.decode(response.body);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt("id", data['id']);
    if (data == "success") {
      Fluttertoast.showToast(
          msg: "Login Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookPage(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Username & Password Incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
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
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 50, 64, 106),
                    // border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                ),
                Center(
                  child: Image.asset("assets/admin_login.png"),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            // Text Login
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 50,
                    color: Color.fromARGB(255, 50, 64, 106),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // TextField Login
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: TextFormField(
                controller: user,
                cursorColor: Color.fromARGB(255, 50, 64, 106),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 50, 64, 106),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: ('Username'),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 50, 64, 106),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(30, 15, 10, 15),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 50, 64, 106),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // TextFormField Password
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: TextFormField(
                controller: pass,
                obscureText: true,
                cursorColor: Color.fromARGB(255, 50, 64, 106),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 50, 64, 106),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: ('Password'),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 50, 64, 106),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(30, 15, 10, 15),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 50, 64, 106),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 50, 64, 106),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                login();
              },
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Poppins bold',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bukan Admin???",
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 20,
                    color: Color.fromARGB(255, 50, 64, 106),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    "Balik la!!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
