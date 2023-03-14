import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:model_test/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:model_test/services/response_model.dart';

import '../services/services.dart';

class ProfileViewModel extends ChangeNotifier {
  User? user;
  final Services services = Services();
  List<User> users = [];
  int perPage = 6;
  int page = 1;
  int totalPage = 2;
  ScrollController scrollController = ScrollController();
  bool loading = false;

  Future getUser(int id) async {
    ResponseModel response = await services.getUser(id);
    if (response.success) {
      user = User.fromJson(response.data!["data"]);
    }
    notifyListeners();
  }

  Future getUsers() async {
    ResponseModel response = await services.getUsers(page);
    //_baseUrl + "?page=$page&per_page=$perPage"));
    //var map = json.decode(response.body);

    if (response.success) {
      users.clear();
      totalPage = response.data!["total_pages"];
      for (var item in response.data!["data"]) {
        users.add(User.fromJson(item));
      }
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
