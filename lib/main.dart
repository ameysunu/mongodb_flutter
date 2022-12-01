import 'package:flutter/material.dart';
import 'package:mongodb_flutter/home.dart';
import 'package:mongodb_flutter/login.dart';
import 'package:realm/realm.dart';

final AppConfiguration _appConfig = AppConfiguration("application-0-jjhdy");
final App app = App(_appConfig);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: app.currentUser != null ? HomePage() : LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
