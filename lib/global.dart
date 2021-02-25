import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const ApiUrl =
    "https://jsonkeeper.com/";
Future<List> PostApi(String url) async{
  url = ApiUrl + url;
  print(url);
  print('hello');
  http.Response res = await http.get(url);
  print(res.toString());
  print('response 2::hello'+res.toString());
  List Reslist =  jsonDecode(res.body);
  print("hjdjhfjds :"+Reslist.toString().length.toString());
  return Reslist;
}

