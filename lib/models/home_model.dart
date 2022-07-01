// class HomeModel
// {
//   String? status;
//   String? message;
//   HomeDataModel? data;

//   HomeModel.fromJson(Map<String, dynamic> json)
//   {
//     status = json['status'];
//     message = json['message'];
//     data = HomeDataModel.fromJson(json['data']);
//   }
// }

// class HomeDataModel
// {
//   List<BookModel> books = [];

//   HomeDataModel.fromJson(Map<String, dynamic> json)
//   {

//     json['books'].forEach((element)
//     {
//       books.add(BookModel.fromJson(element));
//     });
//   }
// }

// class BookModel
// {
//   int? id;
//   String? name;
//   String? description;
//   String? url;

//   BookModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     url = json['url'];

//   }
// }

class HomeModel {
  String? status;
  String? message;
  List<Book>? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Book>[];
      json['data'].forEach((v) {
        data!.add(new Book.fromJson(v));
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

class Book {
  int? id;
  String? name;
  String? description;
  String? file1;
  String? categories;
  String? publishedBy;
  String? year;
  String? audio;
  String? author;
  double? rate;
  String? url;
  String? file2;
  String? url1;
  String? createdAt;
  String? updatedAt;

  Book(
      {this.id,
      this.name,
      this.description,
      this.file1,
      this.url,
      this.file2,
      this.categories,
      this.publishedBy,
      this.year,
      this.audio,
      this.author,
      this.rate,
      this.url1,
      this.createdAt,
      this.updatedAt});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    file1 = json['file1'];
    url = json['url'];
    file2 = json['file2'];
    categories = json['categories'];
    publishedBy = json['published_by'];
    year = json['year'];
    audio = json['audio'];
    author = json['author'];
    rate = json['rate'].toDouble();
    url1 = json['url1'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['file1'] = this.file1;
    data['url'] = this.url;
    data['file2'] = this.file2;
    data['categories'] = this.categories;
    data['published_by'] = this.publishedBy;
    data['year'] = this.year;
    data['audio'] = this.audio;
    data['author'] = this.author;
    data['rate'] = this.rate;
    data['url1'] = this.url1;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// class Data {
//   int? id;
//   String? name;
//   String? description;
//   String? file;
//   String? url;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.name,
//       this.description,
//       this.file,
//       this.url,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     file = json['file'];
//     url = json['url'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['file'] = this.file;
//     data['url'] = this.url;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
