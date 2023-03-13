import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:model_test/models/user_model.dart';
import 'package:http/http.dart' as http;

class ProfileViewModel extends ChangeNotifier {
  User? user;
  final String _baseUrl = 'https://reqres.in/api/users';
  List<User> users = [];
  int perPage = 6;
  int page = 1;
  int totalPage = 2;
  ScrollController scrollController = ScrollController();

  Future getUser(int id) async {
    http.Response response = await http.get(Uri.parse('$_baseUrl/$id'));

    var map = json.decode(response.body);
    user = User.fromJson(map["data"]);
  }

  Future getUsers() async {
    http.Response response =
        await http.get(Uri.parse(_baseUrl + "?page=$page&per_page=$perPage"));
    var map = json.decode(response.body);
    users.clear();
    totalPage = map["total_pages"];

    for (var item in map["data"]) {
      users.add(User.fromJson(item));
    }
    notifyListeners();
  }

  Future setPage(int p) async {
    page = p;
    await getUsers();
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        getUsers();
      }
    });
  }

  // Future getNextPage(int nextpage) async {
  //   http.Response response =
  //       await http.get(Uri.parse("$_baseUrl?page=$nextpage"));
  //   var map = json.decode(response.body);
  //   users.clear();
  //   for (var item in map["data"]) {
  //     users.add(User.fromJson(item));
  //   }
  //   notifyListeners();
  // }
}
