import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../../../models/FastReadingModels/paragraph_model.dart';
import '../../../../network/Remote network/dio_helper.dart';
import '../../../../network/Remote network/end_points.dart';

part 'paragraph_state.dart';

class ParagraphCubit extends Cubit<ParagraphState> {
  ParagraphCubit() : super(ParagraphInitial());

  static ParagraphCubit get(context) => BlocProvider.of(context);

  ParagraphModel? paragraphModel;
  void getParagraph() {
    emit(GetParagraphLoadingState());
    DioHelper.getData(path: PARAGRAPH).then((value) {
      emit(GetParagraphLoadingState());
      paragraphModel = ParagraphModel.fromJson(value.data);
      print(paragraphModel!.paragraph![0]);
      print(paragraphModel!.paragraph![1]);
      print(paragraphModel!.paragraph![1].paragraph);
      print(paragraphModel!.paragraph![1].name);
      emit(GetParagraphSuccessState(paragraphModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetParagraphErrorState());
    });
  }
}
