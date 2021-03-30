// To parse this JSON data, do
//
//     final urlshortnerResponse = urlshortnerResponseFromJson(jsonString);

import 'dart:convert';

UrlshortnerResponse urlshortnerResponseFromJson(String str) => UrlshortnerResponse.fromJson(json.decode(str));

String urlshortnerResponseToJson(UrlshortnerResponse data) => json.encode(data.toJson());

class UrlshortnerResponse {
    UrlshortnerResponse({
        this.resultUrl,
    });

    String resultUrl;

    factory UrlshortnerResponse.fromJson(Map<String, dynamic> json) => UrlshortnerResponse(
        resultUrl: json["result_url"],
    );

    Map<String, dynamic> toJson() => {
        "result_url": resultUrl,
    };
}
