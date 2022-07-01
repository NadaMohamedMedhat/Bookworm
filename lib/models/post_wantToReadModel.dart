// class PostWantToReadModel {
//   String? status;
//   String? message;
//   Data? data;

//   PostWantToReadModel({this.status, this.message, this.data});

//   PostWantToReadModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? userId;
//   String? bookId;
//   String? section;
//   int? id;

//   Data({this.userId, this.bookId, this.section, this.id});

//   Data.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     bookId = json['book_id'];
//     section = json['section'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['book_id'] = this.bookId;
//     data['section'] = this.section;
//     data['id'] = this.id;
//     return data;
//   }
// }

class PostWantToReadModel {
  List<String>? message;
  bool? status;

  PostWantToReadModel({this.message, this.status});

  PostWantToReadModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}