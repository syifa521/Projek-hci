class UserModel {
  int? id;
  String? email;
  String? imageUrl;
  String? name;
  String? nisn;
  String? password;

  UserModel(
      {this.email,
      this.id,
      this.imageUrl,
      this.name,
      this.nisn,
      this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    imageUrl = json['image_url'];
    name = json['name'];
    nisn = json['nisn'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['nisn'] = this.nisn;
    data['password'] = this.password;
    return data;
  }
}