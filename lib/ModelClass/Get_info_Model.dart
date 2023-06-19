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
  List<double> ratingPercents;
  List<Review> reviews;
  int reviewCount;

  Contact({
    required this.contactName,
    required this.trait,
    required this.rating,
    required this.totalRatings,
    required this.ratingPercents,
    required this.reviews,
    required this.reviewCount,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    contactName: json["contact_name"],
    trait: List<int>.from(json["trait"].map((x) => x)),
    rating: json["rating"],
    totalRatings: json["total_ratings"],
    ratingPercents: List<double>.from(json["rating_percents"].map((x) => x?.toDouble())),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    reviewCount: json["review_count"],
  );

  Map<String, dynamic> toJson() => {
    "contact_name": contactName,
    "trait": List<dynamic>.from(trait.map((x) => x)),
    "rating": rating,
    "total_ratings": totalRatings,
    "rating_percents": List<dynamic>.from(ratingPercents.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "review_count": reviewCount,
  };
}

class Review {
  int userId;
  String review;
  String profilePhoto;
  String name;

  Review({
    required this.userId,
    required this.review,
    required this.profilePhoto,
    required this.name,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    userId: json["user_id"],
    review: json["review"],
    profilePhoto: json["profile_photo"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "review": review,
    "profile_photo": profilePhoto,
    "name": name,
  };
}
