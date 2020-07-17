class UserList {
  List<User> users;
  int count;
  int offset;
  int total;
  bool success;

  UserList({this.users, this.count, this.offset, this.total, this.success});

  UserList.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<User>();
      json['users'].forEach((v) {
        users.add(new User.fromJson(v));
      });
    }
    count = json['count'];
    offset = json['offset'];
    total = json['total'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['offset'] = this.offset;
    data['total'] = this.total;
    data['success'] = this.success;
    return data;
  }
}

class UserResult {
  User user;
  bool success;

  UserResult({this.user, this.success});

  UserResult.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class User {
  String sId;
  String type;
  String status;
  bool active;
  String name;
  String username;
  int utcOffset;
  String statusText;
  String avatarETag;

  User(
      {this.sId,
      this.type,
      this.status,
      this.active,
      this.name,
      this.username,
      this.utcOffset,
      this.statusText,
      this.avatarETag});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    status = json['status'];
    active = json['active'];
    name = json['name'];
    username = json['username'];
    utcOffset = json['utcOffset'];
    statusText = json['statusText'];
    avatarETag = json['avatarETag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['active'] = this.active;
    data['name'] = this.name;
    data['username'] = this.username;
    data['utcOffset'] = this.utcOffset;
    data['statusText'] = this.statusText;
    data['avatarETag'] = this.avatarETag;
    return data;
  }
}
