part of 'questions_cubit.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}


class GetQuestionLoadingState extends QuestionsState {}

class GetQuestionSuccessState extends QuestionsState {
  final QuestionsModel questionsModel;

  GetQuestionSuccessState(this.questionsModel);
}

class GetQuestionErrorState extends QuestionsState {}



// class GetAnswersLoadingState extends QuestionsState {}

// class GetAnswersSuccessState extends QuestionsState {
//   final AnswersModel answersModel;

//   GetAnswersSuccessState(this.answersModel);
// }

// class GetAnswersErrorState extends QuestionsState {}