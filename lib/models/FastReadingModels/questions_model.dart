// class QuestionsModel {
//   String? status;
//   String? message;
//   List<Question>? question;

//   QuestionsModel({this.status, this.message, this.question});

//   QuestionsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['question'] != null) {
//       question = <Question>[];
//       json['question'].forEach((v) {
//         question!.add(new Question.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.question != null) {
//       data['question'] = this.question!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Question {
//   int? id;
//   String? question;
//   String? createdAt;
//   String? updatedAt;

//   Question({this.id, this.question, this.createdAt, this.updatedAt});

//   Question.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     question = json['question'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['question'] = this.question;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

class QuestionsModel {
  String? status;
  String? message;
  Answer? answer;

  QuestionsModel({this.status, this.message, this.answer});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    answer =
        json['answer'] != null ? new Answer.fromJson(json['answer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.answer != null) {
      data['answer'] = this.answer!.toJson();
    }
    return data;
  }
}

class Answer {
  int? id;
  String? question;
  String? createdAt;
  String? updatedAt;

  Answer({this.id, this.question, this.createdAt, this.updatedAt});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}