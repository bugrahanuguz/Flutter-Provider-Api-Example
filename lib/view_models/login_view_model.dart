import 'package:flutter/material.dart';
import 'package:model_test/services/response_model.dart';
import '../services/services.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController usernameController =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController =
      TextEditingController(text: "cityslicka");

  Services services = Services();
  bool isLogin = false;

  Future login() async {
    var body = {
      "email": usernameController.text,
      "password": passwordController.text,
    };

    ResponseModel response = await services.login(body);

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      print(response.data);
    }
    isLogin = response.success;
    return response.success;
  }
}
