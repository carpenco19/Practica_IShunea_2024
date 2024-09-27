// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app_flutter/model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future <List<DataModel>>getInfo() async {
    var apiUrl = '/getplaces';
    //creating a get request
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
       
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}