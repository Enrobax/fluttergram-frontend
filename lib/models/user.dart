class User {
  int? id;
  String? name;
  String? username;
  String? bio;
  String? profilePic;

  User({this.id, this.name, this.username, this.bio, this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    bio = json['bio'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['bio'] = this.bio;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
