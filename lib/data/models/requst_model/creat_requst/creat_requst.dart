class CreateRqustModel {
  String? rideId;
  String? userId;
  String? status;
  String? station;
  String? requstId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CreateRqustModel(
      {this.userId,
      this.rideId,
      this.status,
      this.station,
      this.requstId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CreateRqustModel.fromJson(Map<String, dynamic> json) {
    rideId = json['ride'];
    userId = json['user'];
    status = json['status'];
    station = json['station'];
    requstId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ride'] = this.rideId;
    data['user'] = this.userId;
    data['status'] = this.status;
    data['station'] = this.station;
    data['_id'] = this.requstId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
