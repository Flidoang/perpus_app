// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perpustakaan/auth/login_admin.dart';
import 'package:perpustakaan/auth/register.dart';
import 'package:perpustakaan/navbar.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = Uri.parse('http://192.168.137.1/perpustakaan/login.php');
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
          builder: (context) => bottomNav(),
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
        body: Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 50, 64, 106),
              // border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30.30)),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/reading.png",
              height: 350,
              width: 350,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 250,
                ),

                // Text Login
                const Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 50,
                    color: Color.fromARGB(255, 50, 64, 106),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Text form Fied
                SizedBox(
                  width: 350,
                  child: Material(
                    child: TextFormField(
                      controller: user,
                      keyboardType: TextInputType.text,
                      cursorColor: const Color.fromARGB(255, 50, 64, 106),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 50, 64, 106),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 30.0, top: 20.0, bottom: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 50, 64, 106),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: ('Username'),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 50, 64, 106)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: Material(
                    child: TextFormField(
                      controller: pass,
                      obscureText: true,
                      cursorColor: const Color.fromARGB(255, 50, 64, 106),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 50, 64, 106),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 30.0, top: 20.0, bottom: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 50, 64, 106),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: ('Password'),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 50, 64, 106)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: 120, vertical: 20),
                  width: 70.0,
                  height: 40.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(10, 10),
                      backgroundColor: const Color.fromARGB(255, 50, 64, 106),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      login();
                    },
                    child: Text("LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      child: Text(
                        "Tidak punya akun?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                    )
                  ],
                ),

                // Text Button buat Login Admin
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Login Admin",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins Bold',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
