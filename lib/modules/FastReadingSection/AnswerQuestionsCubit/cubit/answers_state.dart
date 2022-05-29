part of 'answers_cubit.dart';

@immutable
abstract class AnswersState {}

class AnswersInitial extends AnswersState {}


class GetAnswersLoadingState extends AnswersState {}

class GetAnswersSuccessState extends AnswersState {
  final AnswersModel answersModel;

  GetAnswersSuccessState(this.answersModel);
}

class GetAnswersErrorState extends AnswersState {}

