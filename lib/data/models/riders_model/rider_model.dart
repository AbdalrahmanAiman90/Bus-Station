class RideModel {
  String? name;
  String? image;
  int? price;
  String? driver;
  String? idRide;
  RideModel({this.name, this.image, this.price, this.driver, this.idRide});

  RideModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    driver = json['user'];
    idRide = json['_id'];
  }
}
