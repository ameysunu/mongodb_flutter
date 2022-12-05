import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongodb_flutter/auth.dart';

import 'config.dart';

runUserCheck() async {
  var db = await Db.create(dbConnUsers);
  try {
    await db.open();
  } on Exception catch (e) {
    print(e.toString());
  }
  var collection = db.collection('details');
  await collection.find(where.eq('id', app.currentUser?.id)).forEach((v) {
    return print(v["id"]);
  });
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
