// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perpustakaan/apuUrl.dart';
import 'package:perpustakaan/auth/login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nama = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController no_hp = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future register() async {
    var url = Uri.parse('${apiUrl1.basicUrl}/register.php');
    var response = await http.post(url as Uri, body: {
      "nama": nama.text,
      "username": user.text,
      "password": pass.text,
      "no_hp": no_hp.text
    });

    var data = json.decode(response.body);
    if (data == "error") {
      Fluttertoast.showToast(
          msg: "This User Already Exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registration Succes",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          child: Stack(children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 50, 64, 106),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 170,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Register",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins Bold',
                          fontSize: 50,
                          color: Color.fromARGB(255, 50, 64, 106),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: Material(
                      child: TextFormField(
                        controller: nama,
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
                          labelText: ('Nama'),
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
                        controller: user,
                        keyboardType: TextInputType.emailAddress,
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
                  SizedBox(
                    width: 350,
                    child: Material(
                      child: TextFormField(
                        controller: no_hp,
                        keyboardType: TextInputType.number,
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
                          labelText: ('No Telp'),
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 50, 64, 106)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 120.0,
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
                        register();
                      },
                      child: const Text("REGISTER",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: Text(
                          "Sudah punya akun?",
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
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
