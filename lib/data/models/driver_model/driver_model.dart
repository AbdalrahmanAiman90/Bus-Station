class DriverModel {
  String? name;
  String? profileImg;
  num? rate;
  List<Review>? review;
  String? id;

  DriverModel({this.name, this.profileImg, this.rate, this.review, this.id});

  DriverModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImg = json["profileImg"];
    rate = json['rate'];

    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(new Review.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;

    data['profileImg'] = this.profileImg;

    data['rate'] = this.rate;
    if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Review {
  String? sId;
  String? title;
  int? rating;
  String? driverId;

  Review({this.sId, this.title, this.rating, this.driverId});

  Review.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    rating = json['rating'];
    driverId = json['driverId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['driverId'] = this.driverId;
    return data;
  }
}
