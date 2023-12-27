class BookModel {
  String? category;
  String? image;
  String? name;
  String? path;

  BookModel({this.category, this.image, this.name, this.path});

  BookModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    image = json['image'];
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['image'] = this.image;
    data['name'] = this.name;
    data['path'] = this.path;
    return data;
  }
}
