/// name : ""
/// email : ""
/// uid : ""
/// profile_pic : ""

class UserModel {
  String _name;
  String _email;
  String _uid;
  String _profilePic;

  String get name => _name;
  String get email => _email;
  String get uid => _uid;
  String get profilePic => _profilePic;

  UserModel({
      String name,
      String email,
      String uid,
      String profilePic}){
    _name = name;
    _email = email;
    _uid = uid;
    _profilePic = profilePic;
}

  UserModel.fromJson(dynamic json) {
    _name = json["name"];
    _email = json["email"];
    _uid = json["uid"];
    _profilePic = json["profile_pic"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["email"] = _email;
    map["uid"] = _uid;
    map["profile_pic"] = _profilePic;
    return map;
  }

}