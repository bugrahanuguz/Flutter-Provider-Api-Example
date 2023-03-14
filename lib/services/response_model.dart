class ResponseModel {
  int statusCode;

  String? errorMessage;
  Map<String, dynamic>? data;
  ResponseModel({required this.statusCode, this.errorMessage, this.data});
  bool get success => statusCode >= 200 && statusCode <= 300;
}
