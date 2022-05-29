import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../../models/FastReadingModels/questions_model.dart';
import '../../../network/Remote network/dio_helper.dart';


part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());

  static QuestionsCubit get(context) => BlocProvider.of(context);

  QuestionsModel? questionsModel;
  QuestionsModel getQuestion(int questionId) {
    emit(GetQuestionLoadingState());
    DioHelper.getData(
      path: 'https://thebook.tech/api/exam/question/$questionId'
      ).then((value) {
      emit(GetQuestionLoadingState());
      questionsModel = QuestionsModel.fromJson(value.data);
      print(questionsModel!.answer);
      print(questionsModel!.answer!.question);
      print(questionsModel!.answer!.question);
     // print(questionsModel!.question![1].question);
      emit(GetQuestionSuccessState(questionsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetQuestionErrorState());
    });
    return questionsModel!;
  }



  // AnswersModel? answersModel;
  // void getAnswers() {
  //   emit(GetAnswersLoadingState());
  //   DioHelper.getData(path: ANSWERS).then((value) {
  //     emit(GetAnswersLoadingState());
  //     answersModel = AnswersModel.fromJson(value.data);
  //     print(answersModel!.answer);
  //     print(answersModel!.answer![1]);
  //     print(answersModel!.answer![1].answer);
  //     print(answersModel!.answer![0].answer);
  //     emit(GetAnswersSuccessState(answersModel!));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetAnswersErrorState());
  //   });
  // }
}
