import 'package:flutter/material.dart';
import 'package:mongodb_flutter/auth.dart';
import 'package:mongodb_flutter/mongoconnect.dart';

class GlobalViewLetters extends StatefulWidget {
  String id;
  String title;
  bool isPrivate;
  String body;
  String date;
  String recordId;
  String username;
  String country;

  GlobalViewLetters(
      {super.key,
      required this.id,
      required this.title,
      required this.isPrivate,
      required this.body,
      required this.date,
      required this.recordId,
      required this.username,
      required this.country});

  @override
  State<GlobalViewLetters> createState() => _GlobalViewLettersState();
}

class _GlobalViewLettersState extends State<GlobalViewLetters> {
  @override
  TextEditingController dateController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  bool liked = false;
  bool loved = false;

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
                    "By: ${widget.username}, ${widget.country}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Icon(Icons.mail, color: Colors.white),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFFB63AAEA), shape: BoxShape.circle),
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
                    readOnly: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Enter a message",
                      filled: true,
                    ),
                  ),
                )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          liked = !liked;
                        });
                      },
                      icon: Icon(this.liked
                          ? Icons.thumb_up
                          : Icons.thumb_up_outlined)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          loved = !loved;
                        });
                      },
                      icon: Icon(this.loved
                          ? Icons.favorite
                          : Icons.favorite_outline)),
                  Flexible(
                    child: TextField(
                      decoration:
                          InputDecoration.collapsed(hintText: "Comments"),
                      style: TextStyle(color: Colors.black),
                      controller: commentsController,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await createComments(widget.recordId,
                            commentsController.text, liked, loved);
                        commentsController.clear();
                      },
                      icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
