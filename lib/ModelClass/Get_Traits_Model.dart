class Get_Traits_Model {
  List<Traits>? traits;
  String? status;

  Get_Traits_Model({this.traits, this.status});

  Get_Traits_Model.fromJson(Map<String, dynamic> json) {
    if (json['traits'] != null) {
      traits = <Traits>[];
      json['traits'].forEach((v) {
        traits!.add(new Traits.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.traits != null) {
      data['traits'] = this.traits!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Traits {
  int? id;
  String? traitName;
  String? traitImage;

  Traits({this.id, this.traitName, this.traitImage});

  Traits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    traitName = json['trait_name'];
    traitImage = json['trait_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trait_name'] = this.traitName;
    data['trait_image'] = this.traitImage;
    return data;
  }
}
