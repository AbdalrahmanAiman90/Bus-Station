class NotifactionModel {
  String? sId;
  String? notification;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  NotifactionModel(
      {this.sId,
      this.notification,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});

  NotifactionModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    notification = json['notification'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['notification'] = this.notification;
    data['user'] = this.user;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
