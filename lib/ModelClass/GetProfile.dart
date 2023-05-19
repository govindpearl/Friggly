class GetProfile {
  String? msg;
  String? status;
  Profile? profile;
  String? image;

  GetProfile({this.msg, this.status, this.profile, this.image});

  GetProfile.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['status'] = this.status;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['image'] = this.image;
    return data;
  }
}

class Profile {
  int? id;
  String? name;
  String? mobileNo;
  String? email;
  String? gender;
  String? doB;
  String? photo;
  String? apiToken;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
        this.name,
        this.mobileNo,
        this.email,
        this.gender,
        this.doB,
        this.photo,
        this.apiToken,
        this.createdAt,
        this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    gender = json['gender'];
    doB = json['DoB'];
    photo = json['photo'];
    apiToken = json['api_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['DoB'] = this.doB;
    data['photo'] = this.photo;
    data['api_token'] = this.apiToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
