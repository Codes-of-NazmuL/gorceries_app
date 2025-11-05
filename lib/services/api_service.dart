// ignore_for_file: strict_top_level_inference, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';
import 'package:grocery_app/models/register_response_model.dart';
import 'package:http/http.dart';

class ApiService extends ChangeNotifier {
  final store = GetStorage();
  RegisterResponse? regresp;
  RegisterResponse? logresp;
  bool logIsLoading = true;
  bool isLoading = true;
  String? token;

  postRegdf(fname, lname, uname, email, password) async {
    regresp = await postRegistration(
        fname: fname,
        lname: lname,
        uname: uname,
        email: email,
        password: password);
    if (regresp == null) {
      isLoading = true;
    } else {
      token = regresp!.data.token;
      if (token != null) {
        store.write("token", token);
      }
      isLoading = false;
    }
    notifyListeners();
  }

  Future postRegistration(
      {required String fname,
      required String lname,
      required String uname,
      required String email,
      required String password}) async {
    final response = await post(Uri.parse("$baseUrl$registerEnd"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "first_name": fname,
          "last_name": lname,
          "username": uname,
          "email": email,
          "password": password
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var res = RegisterResponse.fromJson(data);
      return res;
    }
    {
      return null;
    }
  }

  postLogdf(name, password) async {
    logresp = await postLogin(email: name, password: password);
    if (logresp == null) {
      logIsLoading = true;
    } else {
      token = logresp!.data.token;
      if (token != null) {
        store.write("token", token);
      }
      logIsLoading = false;
    }
    notifyListeners();
  }

  Future postLogin({required String email, required String password}) async {
    final response = await post(Uri.parse("$baseUrl$loginEnd"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"username": email, "password": password}));
    var data = jsonDecode(response.body);
    var res = RegisterResponse.fromJson(data);
    return res;
  }


  getProducts({int?page, int?per_page, int?category_id, String?search, bool?featured}) async {
    page ?? " ";
    per_page ?? " ";
    category_id ?? " ";
    search ?? " ";
    featured ?? " ";
    final Response = await get(Uri.parse(baseUrl + products +
        "page="+page.toString()+
        "per_page=" +per_page.toString() +
      
        "category_id=" +category_id.toString() +
        "search=" +search.toString()+
        "featured=" +featured.toString()));
    if (Response.statusCode == 200) {
      var data = jsonDecode(Response.body);
      print(data);
      return data;
    } else {
      return null;
    }
  }
}
