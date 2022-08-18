// To parse this JSON data, do
//
//     final sportsModel = sportsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SportsModel sportsModelFromJson(String str) =>
    SportsModel.fromJson(json.decode(str));

String sportsModelToJson(SportsModel data) => json.encode(data.toJson());

class SportsModel {
  SportsModel({
    required this.sports,
  });

  List<Sport> sports;

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
        sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
      };
}

class Sport {
  Sport({
    required this.idSport,
    required this.strSport,
    required this.strFormat,
    required this.strSportThumb,
    required this.strSportIconGreen,
    required this.strSportDescription,
  });

  String idSport;
  String strSport;
  String strFormat;
  String strSportThumb;
  String strSportIconGreen;
  String strSportDescription;

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        idSport: json["idSport"],
        strSport: json["strSport"],
        strFormat: json["strFormat"],
        strSportThumb: json["strSportThumb"],
        strSportIconGreen: json["strSportIconGreen"],
        strSportDescription: json["strSportDescription"],
      );

  Map<String, dynamic> toJson() => {
        "idSport": idSport,
        "strSport": strSport,
        "strFormat": strFormat,
        "strSportThumb": strSportThumb,
        "strSportIconGreen": strSportIconGreen,
        "strSportDescription": strSportDescription,
      };
}
