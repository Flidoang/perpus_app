import 'dart:async';

import 'package:flutter/material.dart';
import 'package:perpustakaan/auth/login.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openSplashScreen();
  }

  openSplashScreen() async {
    //bisa diganti beberapa detik sesuai keinginan
    var durasiSplash = const Duration(seconds: 2);

    return Timer(durasiSplash, () {
      //pindah ke halaman home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const Login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 50, 64, 106),
        ),
        child: Container(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Image.asset("assets/logo.png"),
            ),
          ),
        ),
      );
}
