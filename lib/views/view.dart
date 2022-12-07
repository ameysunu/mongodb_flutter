import 'package:flutter/material.dart';
import 'package:mongodb_flutter/auth.dart';
import 'package:mongodb_flutter/mongoconnect.dart';

class ViewLetters extends StatefulWidget {
  String id;
  String title;
  bool isPrivate;
  String body;
  String date;
  String recordId;

  ViewLetters(
      {super.key,
      required this.id,
      required this.title,
      required this.isPrivate,
      required this.body,
      required this.date,
      required this.recordId});

  @override
  State<ViewLetters> createState() => _ViewLettersState();
}

class _ViewLettersState extends State<ViewLetters> {
  @override
  TextEditingController dateController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateController.text = widget.date;
    bodyController.text = widget.body;
  }

  Widget build(BuildContext context) {
    const homeColor = const Color(0xFFBFFC679);

    return Scaffold(
      backgroundColor: const Color(0xFFBF9E3C6),
      appBar: AppBar(
        backgroundColor: homeColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Column(
          children: [
            Text(
              "${widget.title}",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit your letter",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Icon(Icons.mail, color: Colors.white),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFFBC25450), shape: BoxShape.circle),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                readOnly: true,
                style: TextStyle(color: Colors.black),
                controller: dateController,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Date'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  margin: EdgeInsets.all(0),
                  height: 5 * 24.0,
                  child: TextField(
                    controller: bodyController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Enter a message",
                      filled: true,
                    ),
                  ),
                )),
            Row(
              children: [
                Text("Make your letter public?"),
                Switch(
                  value: widget.isPrivate,
                  activeColor: Colors.blue,
                  onChanged: (bool value) {
                    setState(() {
                      widget.isPrivate = value;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () async {
                    await updateLetters(
                        app.currentUser?.id,
                        bodyController.text,
                        dateController.text,
                        widget.isPrivate,
                        widget.recordId);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFBC25450),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Update my letter',
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
