import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:model_test/constants/api_constant.dart';
import 'package:model_test/services/response_model.dart';

class Services {
  Future<ResponseModel> getUser(int id) async {
    http.Response response = await http.get(getUrl("users/$id"));
    Map<String, dynamic>? data;
    try {
      data = json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
    return ResponseModel(statusCode: response.statusCode, data: data);
  }

  Future<ResponseModel> getUsers([int? page, int? perPage]) async {
    http.Response response =
        await http.get(getUrl("users?page=$page&per_page=$perPage"));
    Map<String, dynamic>? data;
    try {
      data = json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
    return ResponseModel(statusCode: response.statusCode, data: data);
  }

  Future<ResponseModel> login(Map<String, dynamic> credential) async {
    http.Response response = await http.post(getUrl("login"), body: credential);
    Map<String, dynamic>? data;
    try {
      data = json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
    return ResponseModel(statusCode: response.statusCode, data: data);
  }
}
