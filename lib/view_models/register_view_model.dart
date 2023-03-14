import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController emailController = TextEditingController();

  get http => null;

  Future register() async {
    // var body = {
    //   "email": usernameController.text,
    //   "password": passwordController.text,
    // };
    // var map = json.encode(body);
    // https.Response response = await http.post(
    //   Uri.parse("https://reqres.in/api/register"),
    //   body: json.encode(body),
    //   // headers: {"Content-Type": "application/json"}
    // );
    // if (response.statusCode >= 200 && response.statusCode <= 300) {
    //   print(response.body);
    // }

    // notifyListeners();
  }
}
