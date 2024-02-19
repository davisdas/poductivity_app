import 'package:flutter/material.dart';
import 'package:poductivity_app/constants/colorconstant.dart';
import 'package:poductivity_app/controller/sharedpref_controller/sharedprefcontroller.dart';
import 'package:poductivity_app/view/bottom_nav/bottom_nav.dart';
import 'package:poductivity_app/view/login_and_registration/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final obj = SharedPrefController();
  @override
  void initState() {
    obj.fetchlogindatails();
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  obj.login == true ? const BottomNav() : const LoginScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Cadmus",
          style: TextStyle(
              fontSize: 30,
              color: ColorConstant.primarygreen,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
