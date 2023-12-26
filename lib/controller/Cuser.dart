import 'package:get/get.dart';
import 'package:mobile3/event/eventPref.dart';
import 'package:mobile3/model/user.dart';

class CUser extends GetxController {
  final Rx<User> _user = User(
    '',
    '',
    '',
  ).obs;

  User get user => _user.value;

  void getUser() async {
    User? user = await EventPref.getUser();
    if (user != null) {
      _user.value = user;
    }
  }
}
