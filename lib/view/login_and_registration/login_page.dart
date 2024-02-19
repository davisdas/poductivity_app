import 'package:flutter/material.dart';
import 'package:poductivity_app/controller/api_controller/api_service_controller.dart';
import 'package:poductivity_app/view/login_and_registration/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var obj = ApiServiceController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                height: 200,
                width: 200,
                color: Colors.green,
              )),
              const Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Please login to continue",
                  style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                  child: Column(
                children: [
                  // username
                  TextFormField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Username",
                        labelText: "Username",
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // password
                  TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Password",
                        labelText: "Password",
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              )),
              const SizedBox(
                height: 15,
              ),

              // loginbutton
              InkWell(
                onTap: () => obj.login(
                    context: context,
                    password: passwordcontroller.text,
                    username: usernamecontroller.text),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  child: const Padding(
                    padding: EdgeInsets.all(13),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    const Text("Don't have account?  "),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen())),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 14),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
