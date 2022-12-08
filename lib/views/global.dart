import 'package:flutter/material.dart';
import 'package:mongodb_flutter/auth.dart';
import 'package:mongodb_flutter/views/widgets.dart';

import '../mongoconnect.dart';
import 'globalview.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Letters from the world",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Column(children: [
                    for (var d in snapshot.data)
                      InkWell(
                        child: globalWidget(d["id"], d["title"], d["date"],
                            d["username"], context), //Color(0xFFB63AAEA)
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GlobalViewLetters(
                                        id: d["id"],
                                        title: d["title"],
                                        isPrivate: d["isPublic"],
                                        body: d["body"],
                                        date: d["date"],
                                        recordId: d["recordId"],
                                        username: d["username"],
                                        country: d["country"],
                                      )));
                        },
                      )
                  ]);
                } else if (!snapshot.hasData) {
                  return Text("No data");
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            future: getAllData(),
          )
        ],
      ),
    );
  }
}
