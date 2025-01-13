part of 'models.dart';

class HttpModel {
  String? hello;

  HttpModel({this.hello});

  HttpModel.fromJson(Map<String, dynamic> json) {
    hello = json['hello'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hello'] = hello;
    return data;
  }
}
