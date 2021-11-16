import 'dart:convert';
import 'package:flutter_kiemtra/model/news.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<News> fetchDataTesla(dynamic s) async {
    String url = s == null
        ? "https://newsapi.org/v2/everything?q=tesla&from=2021-10-16&sortBy=publishedAt&apiKey=09882de9892346f783e0d5df80c6b5da"
        : s;
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      print(jsonData);
      News tl = NewsFromJson(reponse.body);
      print(tl);
      return tl;
    } else {
      return throw Exception('Không có dữ liệu');
    }
  }
}
