// class SearchModel {
//   String? status;
//   String? message;
//   List<Dataa>? dataa;

//   SearchModel({this.status, this.message, this.dataa});

//   SearchModel.fromJson(dynamic json) {
//     status = json['status']; 
//     message = json['message'];
//     if (json['dataa'] != null) {
//       dataa = <Dataa>[];
//       json['data'].forEach((v) {
//         dataa!.add(new Dataa.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> dataa = new Map<String, dynamic>();
//     dataa['status'] = this.status;
//     dataa['message'] = this.message;
//     if (this.dataa != null) {
//       dataa['dataa'] = this.dataa!.map((v) => v.toJson()).toList();
//     }
//     return dataa;
//   }
// }


// class Dataa {
//   int? id;
//   String? name;
//   String? description;
//   String? file1;
//   String? url;
//   String? file2;
//   String? url1;
//   String? createdAt;
//   String? updatedAt;

//   Dataa(
//       {this.id,
//       this.name,
//       this.description,
//       this.file1,
//       this.url,
//       this.file2,
//       this.url1,
//       this.createdAt,
//       this.updatedAt});

//   Dataa.fromJson(Map<String, dynamic> json) {
//     id = json['id']as int; 
//     name = json['name'];
//     description = json['description'];
//     file1 = json['file1'];
//     url = json['url'];
//     file2 = json['file2'];
//     url1 = json['url1'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> dataa = new Map<String, dynamic>();
//     dataa['id'] = this.id; 
//     dataa['name'] = this.name;
//     dataa['description'] = this.description;
//     dataa['file1'] = this.file1;
//     dataa['url'] = this.url;
//     dataa['file2'] = this.file2;
//     dataa['url1'] = this.url1;
//     dataa['created_at'] = this.createdAt;
//     dataa['updated_at'] = this.updatedAt;
//     return dataa;
//   }
// }


// class SearchModel {
//   int? id;
//   String? name;
//   String? description;
//   String? file1;
//   String? url;
//   String? file2;
//   String? url1;
//   String? createdAt;
//   String? updatedAt;

//   SearchModel(
//       {this.id,
//       this.name,
//       this.description,
//       this.file1,
//       this.url,
//       this.file2,
//       this.url1,
//       this.createdAt,
//       this.updatedAt});

//   SearchModel.fromJson(dynamic json )  {
//     id = json['id'] as int;
//     name = json['name'] as String;
//     description = json['description']as String;
//     file1 = json['file1']as String;
//     url = json['url']as String;
//     file2 = json['file2']as String;
//     url1 = json['url1']as String;
//     createdAt = json['created_at']as String;
//     updatedAt = json['updated_at']as String;
//   }

//   dynamic toJson()   {
//     final dynamic data = new Map() ;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['file1'] = this.file1;
//     data['url'] = this.url;
//     data['file2'] = this.file2;
//     data['url1'] = this.url1;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data ;
//   }
// }


// class SearchModel {
//   int? id;
//   String? author;
//   double? rate;
//   String? name;
//   String? categories;
//   String? description;
//   String? file1;
//   String? url;
//   String? file2;
//   String? url1;
//   String? audio;
//   String? createdAt;
//   String? updatedAt;

//   SearchModel(
//       {this.id,
//       this.author,
//       this.rate,
//       this.name,
//       this.categories,
//       this.description,
//       this.file1,
//       this.url,
//       this.file2,
//       this.url1,
//       this.audio,
//       this.createdAt,
//       this.updatedAt});

//   SearchModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     author = json['author'];
//     rate = json['rate'];
//     name = json['name'];
//     categories = json['categories'];
//     description = json['description'];
//     file1 = json['file1'];
//     url = json['url'];
//     file2 = json['file2'];
//     url1 = json['url1'];
//     audio = json['audio'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['author'] = this.author;
//     data['rate'] = this.rate;
//     data['name'] = this.name;
//     data['categories'] = this.categories;
//     data['description'] = this.description;
//     data['file1'] = this.file1;
//     data['url'] = this.url;
//     data['file2'] = this.file2;
//     data['url1'] = this.url1;
//     data['audio'] = this.audio;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

//as List<dynamic>

// class SearchModel {
//   String? status;
//   String? message;
//   List<Data>? data;
//   List<Data1>? data1;
//   List<Data2>? data2;
//   List<Data3>? data3;
//   List<Data4>? data4;

//   SearchModel(
//       {this.status,
//       this.message,
//       this.data,
//       this.data1,
//       this.data2,
//       this.data3,
//       this.data4});

//   SearchModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     if (json['data1'] != null) {
//       data1 = <Data1>[];
//       json['data1'].forEach((v) {
//         data1!.add(new Data1.fromJson(v));
//       });
//     }
//     if (json['data2'] != null) {
//       data2 = <Data2>[];
//       json['data2'].forEach((v) {
//         data2!.add(new Data2.fromJson(v));
//       });
//     }
//     if (json['data3'] != null) {
//       data3 = <Data3>[];
//       json['data3'].forEach((v) {
//         data3!.add(new Data3.fromJson(v));
//       });
//     }
//     if (json['data4'] != null) {
//       data4 = <Data4>[];
//       json['data4'].forEach((v) {
//         data4!.add(new Data4.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.data1 != null) {
//       data['data1'] = this.data1!.map((v) => v.toJson()).toList();
//     }
//     if (this.data2 != null) {
//       data['data2'] = this.data2!.map((v) => v.toJson()).toList();
//     }
//     if (this.data3 != null) {
//       data['data3'] = this.data3!.map((v) => v.toJson()).toList();
//     }
//     if (this.data4 != null) {
//       data['data4'] = this.data4!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? author;
//   double? rate;
//   String? name;
//   String? categories;
//   String? description;
//   String? file1;
//   String? url;
//   String? file2;
//   String? url1;
//   String? audio;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.author,
//       this.rate,
//       this.name,
//       this.categories,
//       this.description,
//       this.file1,
//       this.url,
//       this.file2,
//       this.url1,
//       this.audio,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     author = json['author'];
//     rate = json['rate'];
//     name = json['name'];
//     categories = json['categories'];
//     description = json['description'];
//     file1 = json['file1'];
//     url = json['url'];
//     file2 = json['file2'];
//     url1 = json['url1'];
//     audio = json['audio'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['author'] = this.author;
//     data['rate'] = this.rate;
//     data['name'] = this.name;
//     data['categories'] = this.categories;
//     data['description'] = this.description;
//     data['file1'] = this.file1;
//     data['url'] = this.url;
//     data['file2'] = this.file2;
//     data['url1'] = this.url1;
//     data['audio'] = this.audio;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
// class Data1 {
//   int? id;
//   String? author;
//   double? rate;
//   String? name;
//   String? categories;
//   String? description;
//   String? file1;
//   String? url;
//   String? file2;
//   String? url1;
//   String? audio;
//   String? createdAt;
//   String? updatedAt;

//   Data1(
//       {this.id,
//       this.author,
//       this.rate,
//       this.name,
//       this.categories,
//       this.description,
//       this.file1,
//       this.url,
//       this.file2,
//       this.url1,
//       this.audio,
//       this.createdAt,
//       this.updatedAt});

//   Data1.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     author = json['author'];
//     rate = json['rate'];
//     name = json['name'];
//     categories = json['categories'];
//     description = json['description'];
//     file1 = json['file1'];
//     url = json['url'];
//     file2 = json['file2'];
//     url1 = json['url1'];
//     audio = json['audio'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['author'] = this.author;
//     data['rate'] = this.rate;
//     data['name'] = this.name;
//     data['categories'] = this.categories;
//     data['description'] = this.description;
//     data['file1'] = this.file1;
//     data['url'] = this.url;
//     data['file2'] = this.file2;
//     data['url1'] = this.url1;
//     data['audio'] = this.audio;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
// class Data2 {
//   int? id;
//   String? author;
//   double? rate;
//   String? name;
//   String? categories;
//   String? description;
//   String? file1;
//   String? url;
//   String? file2;
//   String? url1;
//   String? audio;
//   String? createdAt;
//   String? updatedAt;

//   Data2(
//       {this.id,
//       this.author,
//       this.rate,
//       this.name,
//       this.categories,
//       this.description,
//       this.file1,
//       this.url,
//       this.file2,
//       this.url1,
//       this.audio,
//       this.createdAt,
//       this.updatedAt});

//   Data2.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     author = json['author'];
//     rate = json['rate'];
//     name = json['name'];
//     categories = json['categories'];
//     description = json['description'];
//     file1 = json['file1'];
//     url = json['url'];
//     file2 = json['file2'];
//     url1 = json['url1'];
//     audio = json['audio'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['author'] = this.author;
//     data['rate'] = this.rate;
//     data['name'] = this.name;
//     data['categories'] = this.categories;
//     data['description'] = this.description;
//     data['file1'] = this.file1;
//     data['url'] = this.url;
//     data['file2'] = this.file2;
//     data['url1'] = this.url1;
//     data['audio'] = this.audio;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
// class Data3 {
//   int? id;
//   String? author;
//   double? rate;
//   String? name;
//   String? categories;
//   String? description;
//   String? file1;
//   String? url;
//   String? file2;
//   String? url1;
//   String? audio;
//   String? createdAt;
//   String? updatedAt;

//   Data3(
//       {this.id,
//       this.author,
//       this.rate,
//       this.name,
//       this.categories,
//       this.description,
//       this.file1,
//       this.url,
//       this.file2,
//       this.url1,
//       this.audio,
//       this.createdAt,
//       this.updatedAt});

//   Data3.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     author = json['author'];
//     rate = json['rate'];
//     name = json['name'];
//     categories = json['categories'];
//     description = json['description'];
//     file1 = json['file1'];
//     url = json['url'];
//     file2 = json['file2'];
//     url1 = json['url1'];
//     audio = json['audio'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['author'] = this.author;
//     data['rate'] = this.rate;
//     data['name'] = this.name;
//     data['categories'] = this.categories;
//     data['description'] = this.description;
//     data['file1'] = this.file1;
//     data['url'] = this.url;
//     data['file2'] = this.file2;
//     data['url1'] = this.url1;
//     data['audio'] = this.audio;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
// class Data4 {
//   int? id;
//   String? author;
//   double? rate;
//   String? name;
//   String? categories;
//   String? description;
//   String? file1;
//   String? url;
//   String? file2;
//   String? url1;
//   String? audio;
//   String? createdAt;
//   String? updatedAt;

//   Data4(
//       {this.id,
//       this.author,
//       this.rate,
//       this.name,
//       this.categories,
//       this.description,
//       this.file1,
//       this.url,
//       this.file2,
//       this.url1,
//       this.audio,
//       this.createdAt,
//       this.updatedAt});

//   Data4.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     author = json['author'];
//     rate = json['rate'];
//     name = json['name'];
//     categories = json['categories'];
//     description = json['description'];
//     file1 = json['file1'];
//     url = json['url'];
//     file2 = json['file2'];
//     url1 = json['url1'];
//     audio = json['audio'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['author'] = this.author;
//     data['rate'] = this.rate;
//     data['name'] = this.name;
//     data['categories'] = this.categories;
//     data['description'] = this.description;
//     data['file1'] = this.file1;
//     data['url'] = this.url;
//     data['file2'] = this.file2;
//     data['url1'] = this.url1;
//     data['audio'] = this.audio;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

class SearchModel {
  String? status;
  String? message;
  List<Data>? data;

  SearchModel({this.status, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
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
  int? year;
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
      this.year,
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