import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongodb_flutter/mongoconnect.dart';
import 'package:mongodb_flutter/auth.dart';

import '../config.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  bool selectDate = false;

  var dob;

  @override
  void initState() {
    runUserCheck();
  }

  Widget build(BuildContext context) {
    const homeColor = const Color(0xFFB398679);
    const buttonColor = const Color(0xFFB91D07C);
    const ageColor = const Color(0xFFB0082A6);

    return Scaffold(
      backgroundColor: homeColor,
      appBar: AppBar(
        backgroundColor: homeColor,
        elevation: 0,
        title: Text("My Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You have not created your profile yet. Fill your details below, and we can get you started.",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: nameController,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: countryController,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Country'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Text(
                    "Select date of birth",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    height: 200,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime(2022, 11, 11),
                      onDateTimeChanged: (DateTime newDateTime) {
                        dob = newDateTime;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    checkIfUserExists(app.currentUser?.id, nameController.text,
                        countryController.text, dob);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Update my profile',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
