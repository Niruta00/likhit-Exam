// To parse this JSON data, do
//
//     final trafficOrderSign = trafficOrderSignFromMap(jsonString);

import 'dart:convert';

TrafficOrderSign trafficOrderSignFromMap(String str) =>
    TrafficOrderSign.fromMap(json.decode(str));

String trafficOrderSignToMap(TrafficOrderSign data) =>
    json.encode(data.toMap());

class TrafficOrderSign {
  TrafficOrderSign({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  factory TrafficOrderSign.fromMap(Map<String, dynamic> json) =>
      TrafficOrderSign(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
      };
}