
class ScheduleModel {
  List<Doctors>? doctors;

  ScheduleModel({this.doctors});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    if(json["doctors"] is List) {
      doctors = json["doctors"] == null ? null : (json["doctors"] as List).map((e) => Doctors.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(doctors != null) {
      data["doctors"] = doctors?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  String? email;
  String? password;
  String? name;
  dynamic age;
  int? patents;
  String? experence;
  int? rating;
  String? specialization;
  String? education;
  String? about;
  int? profileUpdated;
  int? status;

  Doctors({this.email, this.password, this.name, this.age, this.patents, this.experence, this.rating, this.specialization, this.education, this.about, this.profileUpdated, this.status});

  Doctors.fromJson(Map<String, dynamic> json) {
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    age = json["age"];
    if(json["patents"] is int) {
      patents = json["patents"];
    }
    if(json["experence"] is String) {
      experence = json["experence"];
    }
    if(json["rating"] is int) {
      rating = json["rating"];
    }
    if(json["specialization"] is String) {
      specialization = json["specialization"];
    }
    if(json["education"] is String) {
      education = json["education"];
    }
    if(json["about"] is String) {
      about = json["about"];
    }
    if(json["ProfileUpdated"] is int) {
      profileUpdated = json["ProfileUpdated"];
    }
    if(json["status"] is int) {
      status = json["status"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["name"] = name;
    data["age"] = age;
    data["patents"] = patents;
    data["experence"] = experence;
    data["rating"] = rating;
    data["specialization"] = specialization;
    data["education"] = education;
    data["about"] = about;
    data["ProfileUpdated"] = profileUpdated;
    data["status"] = status;
    return data;
  }
}