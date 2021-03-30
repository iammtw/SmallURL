import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/url_shortner_model.dart';

class UrlShortenerState extends ChangeNotifier {
  final urlController = TextEditingController();

  String shortUrlMessage = "";

  handleGetLinkButton() async {
    final longUrl = urlController.text;
    final String shortUrl = await getShortLink(longUrl);
    shortUrlMessage = "$shortUrl";
    notifyListeners();
  }

  Future<String> getShortLink(String longUrl) async {
    final result = await http
        .post("https://cleanuri.com/api/v1/shorten", body: {"url": longUrl});

    if (result.statusCode == 200) {
      print("Successfully");

      final response = urlshortnerResponseFromJson(result.body);
      return response.resultUrl;
    } else {
      print("Error in API");
      print(result.body);
      return "";
    }
  }
}
