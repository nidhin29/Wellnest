
class ViewMessageModel {
  List<ChatsView>? chats;

  ViewMessageModel({this.chats});

  ViewMessageModel.fromJson(Map<String, dynamic> json) {
    if(json["chats"] is List) {
      chats = json["chats"] == null ? null : (json["chats"] as List).map((e) => ChatsView.fromJson(e)).toList();
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

class ChatsView {
  int? id;
  String? msg;
  int? sendFrom;
  int? viewStatus;
  String? datetime;
  int? room;

  ChatsView({this.id, this.msg, this.sendFrom, this.viewStatus, this.datetime, this.room});

  ChatsView.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["msg"] is String) {
      msg = json["msg"];
    }
    if(json["SendFrom"] is int) {
      sendFrom = json["SendFrom"];
    }
    if(json["ViewStatus"] is int) {
      viewStatus = json["ViewStatus"];
    }
    if(json["datetime"] is String) {
      datetime = json["datetime"];
    }
    if(json["Room"] is int) {
      room = json["Room"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["msg"] = msg;
    data["SendFrom"] = sendFrom;
    data["ViewStatus"] = viewStatus;
    data["datetime"] = datetime;
    data["Room"] = room;
    return data;
  }
}