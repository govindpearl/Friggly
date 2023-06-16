// To parse this JSON data, do
//
//     final getInfoModel = getInfoModelFromJson(jsonString);

import 'dart:convert';

GetInfoModel getInfoModelFromJson(String str) => GetInfoModel.fromJson(json.decode(str));

String getInfoModelToJson(GetInfoModel data) => json.encode(data.toJson());

class GetInfoModel {
  Contact contact;
  String msg;
  String status;

  GetInfoModel({
    required this.contact,
    required this.msg,
    required this.status,
  });

  factory GetInfoModel.fromJson(Map<String, dynamic> json) => GetInfoModel(
    contact: Contact.fromJson(json["contact"]),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "contact": contact.toJson(),
    "msg": msg,
    "status": status,
  };
}

class Contact {
  String contactName;
  List<int> trait;
  String rating;
  int totalRatings;
  List<int> ratingCount;
  List<dynamic> reviews;

  Contact({
    required this.contactName,
    required this.trait,
    required this.rating,
    required this.totalRatings,
    required this.ratingCount,
    required this.reviews,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    contactName: json["contact_name"],
    trait: List<int>.from(json["trait"].map((x) => x)),
    rating: json["rating"],
    totalRatings: json["total_ratings"],
    ratingCount: List<int>.from(json["rating_count"].map((x) => x)),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "contact_name": contactName,
    "trait": List<dynamic>.from(trait.map((x) => x)),
    "rating": rating,
    "total_ratings": totalRatings,
    "rating_count": List<dynamic>.from(ratingCount.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
  };
}
