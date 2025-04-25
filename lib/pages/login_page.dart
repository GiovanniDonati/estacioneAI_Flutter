import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(flex:8,child: Image.network("https://hermes.digitalinnovation.one/assets/diome/logo.png")),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 70,),
              Text("Email", style: TextStyle(color: Colors.white, fontSize: 20),),
              Text("Password", style: TextStyle(color: Colors.white, fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
