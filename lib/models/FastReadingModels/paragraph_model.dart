class ParagraphModel {
  String? status;
  String? message;
  List<Paragraph>? paragraph;

  ParagraphModel({this.status, this.message, this.paragraph});

  ParagraphModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['Paragraph'] != null) {
      paragraph = <Paragraph>[];
      json['Paragraph'].forEach((v) {
        paragraph!.add(new Paragraph.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.paragraph != null) {
      data['Paragraph'] = this.paragraph!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paragraph {
  int? id;
  String? name;
  String? paragraph;
  String? createdAt;
  String? updatedAt;

  Paragraph(
      {this.id, this.name, this.paragraph, this.createdAt, this.updatedAt});

  Paragraph.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    paragraph = json['paragraph'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['paragraph'] = this.paragraph;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}