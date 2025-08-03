class NotificationModel {
  NotificationModel({
      this.notifications, 
      this.onlyUnread,});

  NotificationModel.fromJson(dynamic json) {
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications?.add(Notifications.fromJson(v));
      });
    }
    onlyUnread = json['only_unread'];
  }
  List<Notifications>? notifications;
  bool? onlyUnread;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (notifications != null) {
      map['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    map['only_unread'] = onlyUnread;
    return map;
  }

}

class Notifications {
  Notifications({
      this.id, 
      this.title, 
      this.message, 
      this.read, 
      this.createdAt,});

  Notifications.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    read = json['read'];
    createdAt = json['created_at'];
  }
  String? id;
  String? title;
  String? message;
  bool? read;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['message'] = message;
    map['read'] = read;
    map['created_at'] = createdAt;
    return map;
  }

}