class WantToReadModel {
  String? message;
  bool? status;
  List<Data>? data;

  WantToReadModel({this.message, this.status, this.data});

  WantToReadModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? bookId;
  int? section;
  Carts? carts;

  Data({this.id, this.userId, this.bookId, this.section, this.carts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    section = json['section'];
    carts = json['carts'] != null ? new Carts.fromJson(json['carts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['book_id'] = this.bookId;
    data['section'] = this.section;
    if (this.carts != null) {
      data['carts'] = this.carts!.toJson();
    }
    return data;
  }
}

class Carts {
  int? id;
  String? author;
  double? rate;
  String? name;
  String? categories;
  String? publishedBy;
  String? description;
  String? year;
  String? file1;
  String? url;
  String? file2;
  String? url1;
  String? audio;
  String? createdAt;
  String? updatedAt;

  Carts(
      {this.id,
      this.author,
      this.rate,
      this.name,
      this.categories,
      this.publishedBy,
      this.description,
      this.year,
      this.file1,
      this.url,
      this.file2,
      this.url1,
      this.audio,
      this.createdAt,
      this.updatedAt});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    rate = json['rate'];
    name = json['name'];
    categories = json['categories'];
    publishedBy = json['published by'];
    description = json['description'];
    year = json['year'];
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
    data['published by'] = this.publishedBy;
    data['description'] = this.description;
    data['year'] = this.year;
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