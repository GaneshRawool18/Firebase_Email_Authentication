import 'package:demo_auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Sign up to your Account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: 280,
                    height: 49,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(1, 0.5),
                            blurRadius: 2,
                            blurStyle: BlurStyle.outer)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Email",
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.4))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: 280,
                    height: 49,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(1, 0.5),
                            blurRadius: 2,
                            blurStyle: BlurStyle.outer)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Ehter Password",
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.4))),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (emailController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);

                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return const LoginPage();
                        }));
                      } on FirebaseAuthException catch (obj) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("${obj.message}"),
                          backgroundColor: Colors.amber,
                          duration: Duration(seconds: 5),
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter all field"),
                        backgroundColor: Colors.amber,
                        duration: Duration(seconds: 5),
                      ));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      width: 280,
                      height: 49,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(14, 161, 125, 1),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 0),
                              blurRadius: 2,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
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
