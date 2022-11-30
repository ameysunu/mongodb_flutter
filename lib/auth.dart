import 'package:realm/realm.dart';

final AppConfiguration _appConfig = AppConfiguration("application-0-jjhdy");
final App app = App(_appConfig);

Future<bool> loginMongo(userEmail, userPassword) async {
  bool isSuccess;
  final emailPwCredentials = Credentials.emailPassword(userEmail, userPassword);
  try {
    await app.logIn(emailPwCredentials);
    isSuccess = true;
  } on Exception catch (error) {
    isSuccess = false;
    print(error.toString());
  }
  return isSuccess;
}
