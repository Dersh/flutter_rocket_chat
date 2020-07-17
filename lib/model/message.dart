import 'room.dart';
import 'user.dart';

class MessageList {
  List<Message> messages;
  int count;
  int offset;
  int total;
  bool success;

  MessageList(
      {this.messages, this.count, this.offset, this.total, this.success});

  MessageList.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = new List<Message>();
      json['messages'].forEach((v) {
        messages.add(new Message.fromJson(v));
      });
    }
    count = json['count'];
    offset = json['offset'];
    total = json['total'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['offset'] = this.offset;
    data['total'] = this.total;
    data['success'] = this.success;
    return data;
  }
}

class MessageResult {
  Message message;
  bool success;

  MessageResult({this.message, this.success});

  MessageResult.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Message {
  String t;
  String rid;
  String ts;
  String msg;
  User u;
  bool groupable;
  String drid;
  String sUpdatedAt;
  String sId;
  // List<Null> mentions;
  List<Room> channels;

  Message(
      {this.t,
      this.rid,
      this.ts,
      this.msg,
      this.u,
      this.groupable,
      this.drid,
      this.sUpdatedAt,
      this.sId,
      // this.mentions,
      this.channels});

  Message.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    rid = json['rid'];
    ts = json['ts'];
    msg = json['msg'];
    u = json['u'] != null ? new User.fromJson(json['u']) : null;
    groupable = json['groupable'];
    drid = json['drid'];
    sUpdatedAt = json['_updatedAt'];
    sId = json['_id'];
    // if (json['mentions'] != null) {
    //   mentions = new List<Null>();
    //   json['mentions'].forEach((v) {
    //     mentions.add(new Null.fromJson(v));
    //   });
    // }
    if (json['channels'] != null) {
      channels = new List<Room>();
      json['channels'].forEach((v) {
        channels.add(new Room.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    data['rid'] = this.rid;
    data['ts'] = this.ts;
    data['msg'] = this.msg;
    if (this.u != null) {
      data['u'] = this.u.toJson();
    }
    data['groupable'] = this.groupable;
    data['drid'] = this.drid;
    data['_updatedAt'] = this.sUpdatedAt;
    data['_id'] = this.sId;
    // if (this.mentions != null) {
    //   data['mentions'] = this.mentions.map((v) => v.toJson()).toList();
    // }
    if (this.channels != null) {
      data['channels'] = this.channels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
