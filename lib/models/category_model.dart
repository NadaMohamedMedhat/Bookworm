class CategoryModel {
  String? status;
  String? message;
  List<Data>? data;

  CategoryModel({this.status, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? author;
  double? rate;
  String? name;
  String? categories;
  String? description;
  String? file1;
  String? url;
  String? file2;
  String? url1;
  String? audio;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.author,
      this.rate,
      this.name,
      this.categories,
      this.description,
      this.file1,
      this.url,
      this.file2,
      this.url1,
      this.audio,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    rate = json['rate'];
    name = json['name'];
    categories = json['categories'];
    description = json['description'];
    file1 = json['file1'];
    url = json['url'];
    file2 = json['file2'];
    url1 = json['url1'];
    audio = json['audio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['author'] = this.author;
    data['rate'] = this.rate;
    data['name'] = this.name;
    data['categories'] = this.categories;
    data['description'] = this.description;
    data['file1'] = this.file1;
    data['url'] = this.url;
    data['file2'] = this.file2;
    data['url1'] = this.url1;
    data['audio'] = this.audio;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}