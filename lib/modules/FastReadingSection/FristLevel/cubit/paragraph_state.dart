part of 'paragraph_cubit.dart';

@immutable
abstract class ParagraphState {}

class ParagraphInitial extends ParagraphState {}


class GetParagraphLoadingState extends ParagraphState {}

class GetParagraphSuccessState extends ParagraphState {
  final ParagraphModel paragraphModel;

  GetParagraphSuccessState(this.paragraphModel);
}

class GetParagraphErrorState extends ParagraphState {}


