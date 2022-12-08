import 'package:flutter/material.dart';
import 'package:mongodb_flutter/mongoconnect.dart';
import 'package:mongodb_flutter/views/widgets.dart';

import '../auth.dart';

class MyComments extends StatefulWidget {
  const MyComments({super.key});

  @override
  State<MyComments> createState() => _MyCommentsState();
}

class _MyCommentsState extends State<MyComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBFA8E73),
        elevation: 0,
        title: Text("My Comments"),
      ),
      body: Column(
        children: [
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
                          child: commentsWidget(d["recordId"], d["comments"],
                              d["name"], d["like"], d["love"], context))
                  ]);
                } else if (!snapshot.hasData) {
                  return Text("No data");
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            future: getComments(app.currentUser?.id),
          )
        ],
      ),
    );
  }
}
