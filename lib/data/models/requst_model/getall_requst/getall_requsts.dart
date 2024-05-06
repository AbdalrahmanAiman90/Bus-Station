class GetAllRqustModel {
  String? idRequst;
  Ride? ride;
  String? user;
  String? station;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetAllRqustModel(
      {this.idRequst,
      this.ride,
      this.user,
      this.station,
      this.createdAt,
      this.updatedAt,
      this.iV});

  GetAllRqustModel.fromJson(Map<String, dynamic> json) {
    idRequst = json['_id'];
    ride = json['ride'] != null ? new Ride.fromJson(json['ride']) : null;
    user = json['user'];
    station = json['station'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.idRequst;
    if (this.ride != null) {
      data['ride'] = this.ride!.toJson();
    }
    data['user'] = this.user;
    data['station'] = this.station;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Ride {
  String? idRide;
  String? name;

  Ride({this.idRide, this.name});

  Ride.fromJson(Map<String, dynamic> json) {
    idRide = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.idRide;
    data['name'] = this.name;
    return data;
  }
}
