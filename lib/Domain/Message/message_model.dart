
class MessageModel {
  List<Chats>? chats;

  MessageModel({this.chats});

  MessageModel.fromJson(Map<String, dynamic> json) {
    if(json["chats"] is List) {
      chats = json["chats"] == null ? null : (json["chats"] as List).map((e) => Chats.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(chats != null) {
      data["chats"] = chats?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  int? id;
  String? doctorName;
  String? doctor;
  String? user;

  Chats({this.id, this.doctorName, this.doctor, this.user});

  Chats.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["doctor_name"] is String) {
      doctorName = json["doctor_name"];
    }
    if(json["doctor"] is String) {
      doctor = json["doctor"];
    }
    if(json["User"] is String) {
      user = json["User"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["doctor_name"] = doctorName;
    data["doctor"] = doctor;
    data["User"] = user;
    return data;
  }
}