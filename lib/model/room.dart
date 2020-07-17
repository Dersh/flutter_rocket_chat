import 'message.dart';

class RoomList {
  List<Room> update;
  //List<Null> remove;
  bool success;

  RoomList(
      {this.update,
      // this.remove,
      this.success});

  RoomList.fromJson(Map<String, dynamic> json) {
    if (json['update'] != null) {
      update = new List<Room>();
      json['update'].forEach((v) {
        update.add(new Room.fromJson(v));
      });
    }
    // if (json['remove'] != null) {
    // 	remove = new List<Null>();
    // 	json['remove'].forEach((v) { remove.add(new Null.fromJson(v)); });
    // }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.update != null) {
      data['update'] = this.update.map((v) => v.toJson()).toList();
    }
    // if (this.remove != null) {
    //   data['remove'] = this.remove.map((v) => v.toJson()).toList();
    // }
    data['success'] = this.success;
    return data;
  }
}

class RoomResult {
  Room room;
  bool success;

  RoomResult({this.room, this.success});

  RoomResult.fromJson(Map<String, dynamic> json) {
    room = json['channel'] != null ? new Room.fromJson(json['channel']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.room != null) {
      data['channel'] = this.room.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Room {
  String sId;
  String t;
  String name;
  // List<Null> usernames;
  int usersCount;
  bool isDefault;
  String sUpdatedAt;
  Message lastMessage;
  String lm;

  Room(
      {this.sId,
      this.t,
      this.name,
      // this.usernames,
      this.usersCount,
      this.isDefault,
      this.sUpdatedAt,
      this.lastMessage,
      this.lm});

  Room.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    t = json['t'];
    name = json['name'];
    // if (json['usernames'] != null) {
    // 	usernames = new List<Null>();
    // 	json['usernames'].forEach((v) { usernames.add(new Null.fromJson(v)); });
    // }
    usersCount = json['usersCount'];
    isDefault = json['default'];
    sUpdatedAt = json['_updatedAt'];
    lastMessage = json['lastMessage'] != null
        ? new Message.fromJson(json['lastMessage'])
        : null;
    lm = json['lm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['t'] = this.t;
    data['name'] = this.name;
    // if (this.usernames != null) {
    //   data['usernames'] = this.usernames.map((v) => v.toJson()).toList();
    // }
    data['usersCount'] = this.usersCount;
    data['default'] = this.isDefault;
    data['_updatedAt'] = this.sUpdatedAt;
    if (this.lastMessage != null) {
      data['lastMessage'] = this.lastMessage.toJson();
    }
    data['lm'] = this.lm;
    return data;
  }
}
