class CreateSingleUseRequest {
  CreateSingleUseRequest({
      this.id, 
      this.name, 
      this.email, 
      this.personalEmail, 
      this.phoneNumber, 
      this.type, 
      this.major, 
      this.password,});

  CreateSingleUseRequest.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    personalEmail = json['personal_email'];
    phoneNumber = json['phone_number'];
    type = json['type'];
    major = json['major'];
    password = json['password'];
  }
  num? id;
  String? name;
  String? email;
  String? personalEmail;
  String? phoneNumber;
  String? type;
  String? major;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['personal_email'] = personalEmail;
    map['phone_number'] = phoneNumber;
    map['type'] = type;
    map['major'] = major;
    map['password'] = password;
    return map;
  }

}