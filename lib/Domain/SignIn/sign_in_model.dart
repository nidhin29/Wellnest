class SignInModel {
  String? message;
  String? email;
  String? deviceid;

  SignInModel({this.message, this.email,this.deviceid});

  SignInModel.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["deviceid"] is String) {
      deviceid = json["deviceid"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["email"] = email;
    data["deviceid"] = deviceid;
    return data;
  }
}
