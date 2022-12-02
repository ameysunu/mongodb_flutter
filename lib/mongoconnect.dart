import 'package:mongo_dart/mongo_dart.dart';

import 'config.dart';

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
