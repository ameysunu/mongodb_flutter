import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    const homeColor = const Color(0xFFBFFC679);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150.0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: homeColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
        ],
      ),
    );
  }
}
