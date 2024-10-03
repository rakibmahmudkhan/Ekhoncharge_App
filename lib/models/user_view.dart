import 'package:ekhoncharge/models/admin_user.dart';

class UserView {
  String? _status;
  int? _code;
  String? _message;
  String? _details;
  UserData? _data;

  UserView(
      {String? status,
      int? code,
      String? message,
      String? details,
      UserData? data}) {
    if (status != null) {
      _status = status;
    }
    if (code != null) {
      _code = code;
    }
    if (message != null) {
      _message = message;
    }
    if (details != null) {
      _details = details;
    }
    if (data != null) {
      _data = data;
    }
  }

  String? get status => _status;

  set status(String? status) => _status = status;

  int? get code => _code;

  set code(int? code) => _code = code;

  String? get message => _message;

  set message(String? message) => _message = message;

  String? get details => _details;

  set details(String? details) => _details = details;

  UserData? get data => _data;

  set data(UserData? data) => _data = data;

  UserView.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    _details = json['details'];
    _data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}
