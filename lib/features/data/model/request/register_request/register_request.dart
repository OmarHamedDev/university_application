class RegisterRequest {
  RegisterRequest({
      this.role, 
      this.name, 
      this.email, 
      this.password, 
      this.confirmPassword, 
      this.phoneNumber, 
      this.studentId,});

  RegisterRequest.fromJson(dynamic json) {
    role = json['role'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    phoneNumber = json['phoneNumber'];
    studentId = json['studentId'];
  }
  String? role;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  String? studentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['phoneNumber'] = phoneNumber;
    map['studentId'] = studentId;
    return map;
  }

}