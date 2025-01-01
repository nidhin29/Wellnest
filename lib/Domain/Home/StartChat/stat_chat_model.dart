
class StartChatModel {
  int? room;
  String? doctorName;

  StartChatModel({this.room, this.doctorName});

  StartChatModel.fromJson(Map<String, dynamic> json) {
    if(json["Room"] is int) {
      room = json["Room"];
    }
    if(json["Doctor_Name"] is String) {
      doctorName = json["Doctor_Name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Room"] = room;
    data["Doctor_Name"] = doctorName;
    return data;
  }
}