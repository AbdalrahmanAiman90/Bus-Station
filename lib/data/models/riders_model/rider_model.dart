class RideModel {
  String? name;
  String? image;
  int? price;
  String? driver;

  RideModel({
    this.name,
    this.image,
    this.price,
    this.driver,
  });

  RideModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    driver = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['user'] = this.driver;

    return data;
  }
}
