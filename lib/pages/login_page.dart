import 'package:estacioneai/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // const SizedBox(height: 100,),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        "https://cdn.awsli.com.br/2500x2500/1991/1991091/produto/258578291/sqn-10076-pinguim-4z4v08xdup.png",
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Já tem cadastro?",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Text(
                  "Faça seu login e make the change_",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 70),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple[300]!),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.purple[300],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: TextField(
                    obscureText: isObscure,
                    onChanged: (value) {
                      password = value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple[300]!),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.lock, color: Colors.purple[300]),
                      suffixIcon: InkWell(
                        onTap:
                            () => setState(() {
                              isObscure = !isObscure;
                            }),
                        child: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.purple[300],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (email == "admin" && password == "admin") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          Colors.purple[400],
                        ),
                      ),
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: Text(
                    "Esqueci minha senha",
                    style: TextStyle(color: Colors.yellow, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    "Criar conta",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
