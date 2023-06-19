// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  String msg;
  String status;
  Profile profile;
  String image;
  OtherDetails otherDetails;

  UserProfileModel({
    required this.msg,
    required this.status,
    required this.profile,
    required this.image,
    required this.otherDetails,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    msg: json["msg"],
    status: json["status"],
    profile: Profile.fromJson(json["profile"]),
    image: json["image"],
    otherDetails: OtherDetails.fromJson(json["other_details"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "status": status,
    "profile": profile.toJson(),
    "image": image,
    "other_details": otherDetails.toJson(),
  };
}

class OtherDetails {
  List<int> trait;
  String avgRating;
  List<int> ratingPercents;
  int reviewCount;
  List<Review> reviews;
  int totalRatings;

  OtherDetails({
    required this.trait,
    required this.avgRating,
    required this.ratingPercents,
    required this.reviewCount,
    required this.reviews,
    required this.totalRatings,
  });

  factory OtherDetails.fromJson(Map<String, dynamic> json) => OtherDetails(
    trait: List<int>.from(json["trait"].map((x) => x)),
    avgRating: json["avg_rating"],
    ratingPercents: List<int>.from(json["rating_percents"].map((x) => x)),
    reviewCount: json["review_count"],
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    totalRatings: json["total_ratings"],
  );

  Map<String, dynamic> toJson() => {
    "trait": List<dynamic>.from(trait.map((x) => x)),
    "avg_rating": avgRating,
    "rating_percents": List<dynamic>.from(ratingPercents.map((x) => x)),
    "review_count": reviewCount,
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "total_ratings": totalRatings,
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

class Profile {
  int id;
  String name;
  String mobileNo;
  String email;
  String gender;
  DateTime doB;
  String photo;
  String apiToken;
  DateTime createdAt;
  DateTime updatedAt;

  Profile({
    required this.id,
    required this.name,
    required this.mobileNo,
    required this.email,
    required this.gender,
    required this.doB,
    required this.photo,
    required this.apiToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    name: json["name"],
    mobileNo: json["mobileNo"],
    email: json["email"],
    gender: json["gender"],
    doB: DateTime.parse(json["DoB"]),
    photo: json["photo"],
    apiToken: json["api_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobileNo": mobileNo,
    "email": email,
    "gender": gender,
    "DoB": "${doB.year.toString().padLeft(4, '0')}-${doB.month.toString().padLeft(2, '0')}-${doB.day.toString().padLeft(2, '0')}",
    "photo": photo,
    "api_token": apiToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
