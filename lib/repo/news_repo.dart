import 'package:airbus_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:airbus_app/constantes.dart';

import '../models/code.dart';
class NewsRepo {
    fetchNews() async {
    List<News> newss = [];
    Uri url= Uri.parse(uurl+'User/Add');
    var response = await http.get(url);

      var data = json.decode(response.body);
      data.map((news) => newss.add(News.fromJson(news))).toList();
      return newss;
  }
    fetchcodes() async {
      List<Code> codess = [];
      Uri url= Uri.parse(uurl+'User/Add');
      var response = await http.get(url);

      var data = json.decode(response.body);
      data.map((news) => codess.add(Code.fromJson(news))).toList();
      return codess.first;
    }
}