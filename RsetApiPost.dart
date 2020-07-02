import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class RestApiPost {
  String url = "https://covid-193.p.rapidapi.com/statistics";
  _buildHeader() {
    return {
      'Accept': 'application/json',
      'x-rapidapi-host': 'covid-193.p.rapidapi.com',
      'x-rapidapi-key': 'e239db90f7msh449d2c434933b3fp158421jsn4f036309110c',
      'useQueryString': 'true'
    };
  }

  Future<Map<String, dynamic>> postData(dataToBePosted) async {
    http.Response response =
        await http.post(url, headers: _buildHeader(), body: dataToBePosted);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
