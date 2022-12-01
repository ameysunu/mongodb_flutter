import 'package:realm/realm.dart';

final AppConfiguration _appConfig = AppConfiguration("application-0-jjhdy");
final App app = App(_appConfig);

bool isSuccess = false;

loginMongo(userEmail, userPassword) async {
  final emailPwCredentials = Credentials.emailPassword(userEmail, userPassword);
  try {
    await app.logIn(emailPwCredentials);
    isSuccess = true;
  } on Exception catch (error) {
    print(error.toString());
    isSuccess = false;
  }
}
