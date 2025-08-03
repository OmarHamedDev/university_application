class GraduatesModel {
  GraduatesModel({
      this.status, 
      this.data,});

  GraduatesModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.specialized, 
      this.profile, 
      this.photo,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    specialized = json['specialized'];
    profile = json['profile'];
    photo = json['photo'];
  }
  num? id;
  String? name;
  String? specialized;
  String? profile;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['specialized'] = specialized;
    map['profile'] = profile;
    map['photo'] = photo;
    return map;
  }

}