import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongodb_flutter/auth.dart';

import 'config.dart';

runUserCheck(userId) async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }
  var collection = db.collection('details');
  // await collection.find(where.eq('id', userId)).forEach((v) {
  //   userId = v;
  // });

  var currentUser = await collection.findOne({"id": userId});
  return currentUser?["username"] ?? "";
}

mongoAtlasInsert(userId, userName, countryName, dob) async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }
  var collection = db.collection('details');
  await collection.insertOne({
    'id': userId,
    'username': userName,
    'countryname': countryName,
    'dob': dob
  });
}

checkIfUserExists(userId, userName, countryName, dob) async {
  var existingId;
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }
  var collection = db.collection('details');
  await collection
      .find(where.eq('id', userId))
      .forEach((v) => existingId = v["id"]);
  print(existingId);
  if (existingId == app.currentUser?.id) {
    mongoAtlasUpdate(userId, userName, countryName, dob);
  } else {
    mongoAtlasInsert(userId, userName, countryName, dob);
  }
}

mongoAtlasUpdate(userId, userName, countryName, dob) async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }
  var collection = db.collection('details');
  var currentUser = await collection.findOne({"id": userId});
  currentUser!["username"] = userName;
  currentUser["countryname"] = countryName;
  currentUser["dob"] = dob;

  await collection.replaceOne({"id": userId}, currentUser);
}

Future getInfo(userId) async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }

  DbCollection coll = db.collection('letters');
  var test = await coll.find({'id': userId}).toList();
  return test;
}

Future<void> createDocuments(
    userId, title, body, date, isPublic, recordId) async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }

  var personalData = await getPersonalDetails(app.currentUser?.id);
  var country = personalData[0]["countryname"];
  var username = personalData[0]["username"];

  var collection = db.collection('letters');
  await collection.insertOne({
    'recordId': recordId,
    'id': userId,
    'username': username,
    'country': country,
    'title': title,
    'body': body,
    'date': date,
    'isPublic': isPublic
  });
}

Future<void> updateLetters(userId, body, date, isPublic, recordId) async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }

  var collection = db.collection('letters');
  var currentLetter = await collection.findOne({"recordId": recordId});
  currentLetter!["body"] = body;
  currentLetter["isPublic"] = isPublic;

  await collection.replaceOne({"recordId": recordId}, currentLetter);
}

Future getAllData() async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }

  DbCollection coll = db.collection('letters');
  var allLetters = await coll.find({'isPublic': true}).toList();
  return allLetters;
}

Future getPersonalDetails(userId) async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }

  DbCollection coll = db.collection('details');
  var test = await coll.find({'id': userId}).toList();
  return test;
}
