class VerifyResetCodeRequest {
  String ? resetCode;
  VerifyResetCodeRequest({required this.resetCode});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["resetCode"] = resetCode;
    return map;
  }
}
