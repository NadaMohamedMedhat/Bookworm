import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../../../models/FastReadingModels/answer_model.dart';
import '../../../../network/Remote network/dio_helper.dart';
import '../../../../network/Remote network/end_points.dart';

part 'answers_state.dart';

class AnswersCubit extends Cubit<AnswersState> {
  AnswersCubit() : super(AnswersInitial());

  static AnswersCubit get(context) => BlocProvider.of(context);

  AnswersModel? answersModel;
  void getAnswers() {
    emit(GetAnswersLoadingState());
    DioHelper.getData(path: ANSWERS).then((value) {
      emit(GetAnswersLoadingState());
      answersModel = AnswersModel.fromJson(value.data);
      print(answersModel!.answer);
      print(answersModel!.answer![1]);
      print(answersModel!.answer![1].answer);
      print(answersModel!.answer![0].answer);
      emit(GetAnswersSuccessState(answersModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetAnswersErrorState());
    });
  }
}
