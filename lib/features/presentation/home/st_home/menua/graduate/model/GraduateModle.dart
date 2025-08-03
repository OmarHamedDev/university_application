class GraduateModel {
  GraduateModel({
      this.status, 
      this.data,});

  GraduateModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.phone, 
      this.age, 
      this.specialized, 
      this.company, 
      this.profile, 
      this.photo, 
      this.experience,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    age = json['age'];
    specialized = json['specialized'];
    company = json['company'];
    profile = json['profile'];
    photo = json['photo'];
    experience = json['experience'];
  }
  num? id;
  String? name;
  String? phone;
  String? age;
  String? specialized;
  String? company;
  String? profile;
  String? photo;
  String? experience;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['age'] = age;
    map['specialized'] = specialized;
    map['company'] = company;
    map['profile'] = profile;
    map['photo'] = photo;
    map['experience'] = experience;
    return map;
  }

}