class CommintModel {
  String? title;
  int? rating;
  String? user;

  CommintModel({
    this.title,
    this.rating,
    this.user,
  });

  CommintModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    rating = json['rating'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['user'] = this.user;

    return data;
  }
}
