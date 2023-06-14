class Get_Info_Model {
  List<Contact>? contact;
  String? msg;
  String? status;

  Get_Info_Model({this.contact, this.msg, this.status});

  Get_Info_Model.fromJson(Map<String, dynamic> json) {
    if (json['contact'] != null) {
      contact = <Contact>[];
      json['contact'].forEach((v) {
        contact!.add(new Contact.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contact != null) {
      data['contact'] = this.contact!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Contact {
  String? contactName;
  String? traits;
  String? rating;

  Contact({this.contactName, this.traits, this.rating});

  Contact.fromJson(Map<String, dynamic> json) {
    contactName = json['contact_name'];
    traits = json['traits'].toString();
    rating = json['rating'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_name'] = this.contactName;
    data['traits'] = this.traits;
    data['rating'] = this.rating;
    return data;
  }
}