import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:exec_penal_app/utils/model.dart';

class FakeApi {
  static List<Data> parseSchedules(String responseBody) {
    final parsed = json.decode(responseBody);
    return parsed["data"].map<Data>((json) => Data.fromJson(json)).toList();
  }

  static Future<List<Data>> getData() async {
    String url = '';
    url =
        'https://fakerapi.it/api/v1/persons?_quantity=100&_gender=male&_birthday_start=2021-11-25&_birthday_end=2021-12-31';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Data> list = parseSchedules(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
