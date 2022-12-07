import 'package:flutter/material.dart';
import 'package:mongodb_flutter/auth.dart';
import 'package:mongodb_flutter/dashboard.dart';
import 'package:mongodb_flutter/views/widgets.dart';

import 'mongoconnect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const homeColor = const Color(0xFFBFFC679);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: homeColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()),
                          );
                        },
                        icon: Icon(
                          Icons.dashboard,
                          color: Colors.black26,
                        )),
                    new Center(
                      child: new Text(
                        "Welcome",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          logoutUser();
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.deepPurpleAccent,
                        ))
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "My Letters",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      detailWidget(d["id"], d["title"], d["date"], context)
                  ]);
                } else if (!snapshot.hasData) {
                  return Text("No data");
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            future: getInfo(app.currentUser?.id),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFB398679),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
