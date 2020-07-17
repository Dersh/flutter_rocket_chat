class SelfProfile {
  String sId;
  Services services;
  List<Emails> emails;
  String status;
  bool active;
  String sUpdatedAt;
  List<String> roles;
  String name;
  String username;
  String avatarUrl;
  Settings settings;
  bool success;

  SelfProfile(
      {this.sId,
      this.services,
      this.emails,
      this.status,
      this.active,
      this.sUpdatedAt,
      this.roles,
      this.name,
      this.username,
      this.avatarUrl,
      this.settings,
      this.success});

  SelfProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    services = json['services'] != null
        ? new Services.fromJson(json['services'])
        : null;
    if (json['emails'] != null) {
      emails = new List<Emails>();
      json['emails'].forEach((v) {
        emails.add(new Emails.fromJson(v));
      });
    }
    status = json['status'];
    active = json['active'];
    sUpdatedAt = json['_updatedAt'];
    roles = json['roles'].cast<String>();
    name = json['name'];
    username = json['username'];
    avatarUrl = json['avatarUrl'];
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.services != null) {
      data['services'] = this.services.toJson();
    }
    if (this.emails != null) {
      data['emails'] = this.emails.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['active'] = this.active;
    data['_updatedAt'] = this.sUpdatedAt;
    data['roles'] = this.roles;
    data['name'] = this.name;
    data['username'] = this.username;
    data['avatarUrl'] = this.avatarUrl;
    if (this.settings != null) {
      data['settings'] = this.settings.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Services {
  Password password;

  Services({this.password});

  Services.fromJson(Map<String, dynamic> json) {
    password = json['password'] != null
        ? new Password.fromJson(json['password'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.password != null) {
      data['password'] = this.password.toJson();
    }
    return data;
  }
}

class Password {
  String bcrypt;

  Password({this.bcrypt});

  Password.fromJson(Map<String, dynamic> json) {
    bcrypt = json['bcrypt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bcrypt'] = this.bcrypt;
    return data;
  }
}

class Emails {
  String address;
  bool verified;

  Emails({this.address, this.verified});

  Emails.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['verified'] = this.verified;
    return data;
  }
}

class Settings {
  Preferences preferences;

  Settings({this.preferences});

  Settings.fromJson(Map<String, dynamic> json) {
    preferences = json['preferences'] != null
        ? new Preferences.fromJson(json['preferences'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.preferences != null) {
      data['preferences'] = this.preferences.toJson();
    }
    return data;
  }
}

class Preferences {
  bool enableAutoAway;
  int idleTimeLimit;
  bool desktopNotificationRequireInteraction;
  String audioNotifications;
  String desktopNotifications;
  String mobileNotifications;
  bool unreadAlert;
  bool useEmojis;
  bool convertAsciiEmoji;
  bool autoImageLoad;
  bool saveMobileBandwidth;
  bool collapseMediaByDefault;
  bool hideUsernames;
  bool hideRoles;
  bool hideFlexTab;
  bool hideAvatars;
  bool sidebarGroupByType;
  String sidebarViewMode;
  bool sidebarHideAvatar;
  bool sidebarShowUnread;
  String sidebarSortby;
  bool showMessageInMainThread;
  bool sidebarShowFavorites;
  String sendOnEnter;
  int messageViewMode;
  String emailNotificationMode;
  String newRoomNotification;
  String newMessageNotification;
  bool muteFocusedConversations;
  int notificationsSoundVolume;
  bool sidebarShowDiscussion;

  Preferences(
      {this.enableAutoAway,
      this.idleTimeLimit,
      this.desktopNotificationRequireInteraction,
      this.audioNotifications,
      this.desktopNotifications,
      this.mobileNotifications,
      this.unreadAlert,
      this.useEmojis,
      this.convertAsciiEmoji,
      this.autoImageLoad,
      this.saveMobileBandwidth,
      this.collapseMediaByDefault,
      this.hideUsernames,
      this.hideRoles,
      this.hideFlexTab,
      this.hideAvatars,
      this.sidebarGroupByType,
      this.sidebarViewMode,
      this.sidebarHideAvatar,
      this.sidebarShowUnread,
      this.sidebarSortby,
      this.showMessageInMainThread,
      this.sidebarShowFavorites,
      this.sendOnEnter,
      this.messageViewMode,
      this.emailNotificationMode,
      this.newRoomNotification,
      this.newMessageNotification,
      this.muteFocusedConversations,
      this.notificationsSoundVolume,
      this.sidebarShowDiscussion});

  Preferences.fromJson(Map<String, dynamic> json) {
    enableAutoAway = json['enableAutoAway'];
    idleTimeLimit = json['idleTimeLimit'];
    desktopNotificationRequireInteraction =
        json['desktopNotificationRequireInteraction'];
    audioNotifications = json['audioNotifications'];
    desktopNotifications = json['desktopNotifications'];
    mobileNotifications = json['mobileNotifications'];
    unreadAlert = json['unreadAlert'];
    useEmojis = json['useEmojis'];
    convertAsciiEmoji = json['convertAsciiEmoji'];
    autoImageLoad = json['autoImageLoad'];
    saveMobileBandwidth = json['saveMobileBandwidth'];
    collapseMediaByDefault = json['collapseMediaByDefault'];
    hideUsernames = json['hideUsernames'];
    hideRoles = json['hideRoles'];
    hideFlexTab = json['hideFlexTab'];
    hideAvatars = json['hideAvatars'];
    sidebarGroupByType = json['sidebarGroupByType'];
    sidebarViewMode = json['sidebarViewMode'];
    sidebarHideAvatar = json['sidebarHideAvatar'];
    sidebarShowUnread = json['sidebarShowUnread'];
    sidebarSortby = json['sidebarSortby'];
    showMessageInMainThread = json['showMessageInMainThread'];
    sidebarShowFavorites = json['sidebarShowFavorites'];
    sendOnEnter = json['sendOnEnter'];
    messageViewMode = json['messageViewMode'];
    emailNotificationMode = json['emailNotificationMode'];
    newRoomNotification = json['newRoomNotification'];
    newMessageNotification = json['newMessageNotification'];
    muteFocusedConversations = json['muteFocusedConversations'];
    notificationsSoundVolume = json['notificationsSoundVolume'];
    sidebarShowDiscussion = json['sidebarShowDiscussion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enableAutoAway'] = this.enableAutoAway;
    data['idleTimeLimit'] = this.idleTimeLimit;
    data['desktopNotificationRequireInteraction'] =
        this.desktopNotificationRequireInteraction;
    data['audioNotifications'] = this.audioNotifications;
    data['desktopNotifications'] = this.desktopNotifications;
    data['mobileNotifications'] = this.mobileNotifications;
    data['unreadAlert'] = this.unreadAlert;
    data['useEmojis'] = this.useEmojis;
    data['convertAsciiEmoji'] = this.convertAsciiEmoji;
    data['autoImageLoad'] = this.autoImageLoad;
    data['saveMobileBandwidth'] = this.saveMobileBandwidth;
    data['collapseMediaByDefault'] = this.collapseMediaByDefault;
    data['hideUsernames'] = this.hideUsernames;
    data['hideRoles'] = this.hideRoles;
    data['hideFlexTab'] = this.hideFlexTab;
    data['hideAvatars'] = this.hideAvatars;
    data['sidebarGroupByType'] = this.sidebarGroupByType;
    data['sidebarViewMode'] = this.sidebarViewMode;
    data['sidebarHideAvatar'] = this.sidebarHideAvatar;
    data['sidebarShowUnread'] = this.sidebarShowUnread;
    data['sidebarSortby'] = this.sidebarSortby;
    data['showMessageInMainThread'] = this.showMessageInMainThread;
    data['sidebarShowFavorites'] = this.sidebarShowFavorites;
    data['sendOnEnter'] = this.sendOnEnter;
    data['messageViewMode'] = this.messageViewMode;
    data['emailNotificationMode'] = this.emailNotificationMode;
    data['newRoomNotification'] = this.newRoomNotification;
    data['newMessageNotification'] = this.newMessageNotification;
    data['muteFocusedConversations'] = this.muteFocusedConversations;
    data['notificationsSoundVolume'] = this.notificationsSoundVolume;
    data['sidebarShowDiscussion'] = this.sidebarShowDiscussion;
    return data;
  }
}
