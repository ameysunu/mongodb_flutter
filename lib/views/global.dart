import 'package:flutter/material.dart';

class GlobalLetters extends StatefulWidget {
  const GlobalLetters({super.key});

  @override
  State<GlobalLetters> createState() => _GlobalLettersState();
}

class _GlobalLettersState extends State<GlobalLetters> {
  @override
  Widget build(BuildContext context) {
    const homeColor = const Color(0xFFBFFC679);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: homeColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Global Letters",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "Letters from all over the world",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
