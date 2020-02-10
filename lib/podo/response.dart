// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
  DateTime time;
  String assetIdBase;
  String assetIdQuote;
  double rate;

  Response({
    this.time,
    this.assetIdBase,
    this.assetIdQuote,
    this.rate,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        time: DateTime.parse(json["time"]),
        assetIdBase: json["asset_id_base"],
        assetIdQuote: json["asset_id_quote"],
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "asset_id_base": assetIdBase,
        "asset_id_quote": assetIdQuote,
        "rate": rate,
      };
}
