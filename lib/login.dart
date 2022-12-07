import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mongodb_flutter/auth.dart';
import 'package:mongodb_flutter/home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const backgroundColor = const Color(0xFFBF9E3C6);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello there!",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: SvgPicture.asset("images/home.svg",
                      semanticsLabel: 'Acme Logo')),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Image.asset('images/mongo.jpg'),
                        ),
                      ),
                      Text(
                        "Sign in with Mongo Auth",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  onPressed: () async {
                    await loginMongo(
                        emailController.text, passwordController.text);
                    if (isSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              "An error has occurred while logging you in"),
                          duration: Duration(seconds: 5)));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
