import 'package:flutter/material.dart';

Widget detailWidget(userId, title, date, context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Container(
              child: Icon(Icons.mail, color: Colors.white),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Color(0xFFBC25450), shape: BoxShape.circle),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Spacer()
        ],
      ),
    ),
  );
}

Widget globalWidget(userId, title, date, context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Container(
              child: Icon(Icons.public, color: Colors.white),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Color(0xFFB63AAEA), shape: BoxShape.circle),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Spacer()
        ],
      ),
    ),
  );
}
