class ResetPasswordRequest {
  String email;
  String  newPassword;
  ResetPasswordRequest({required this.email,required this.newPassword});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["email"] = email;
    map["newPassword"] = newPassword;
    return map;
  }
}
