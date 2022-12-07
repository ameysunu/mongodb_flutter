import 'package:flutter/material.dart';
import 'package:mongodb_flutter/views/profile.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    const backgroundColor = const Color(0xFFBF9E3C6);
    const homeColor = const Color(0xFFBFFC679);
    const boxColor = const Color(0xFFB398679);
    const secondBoxColor = const Color(0xFFBFF8981);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: homeColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProfile()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.transparent,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Update profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: secondBoxColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
