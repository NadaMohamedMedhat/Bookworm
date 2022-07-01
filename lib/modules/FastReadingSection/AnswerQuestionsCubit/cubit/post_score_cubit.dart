import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/FastReadingModels/post_score_model.dart';
import 'package:graduation_project/modules/FastReadingSection/AnswerQuestionsCubit/cubit/post_score_states.dart';
import 'package:graduation_project/network/Remote%20network/dio_helper.dart';
import 'package:graduation_project/network/Remote%20network/end_points.dart';

class PostScoreCubit extends Cubit<PostScoreStates> {
  PostScoreCubit() : super(PostScoreInitialState());

  static PostScoreCubit get(context) => BlocProvider.of(context);

  

  PostScoreModel? postScoreModel;

  void postUserScore(String uID, String score, String level) {
    emit(PostScoreLoadingState());
    DioHelper.postData(path: POSTSCORE, data: {
      'user_id': uID,
      'score':score,
      'level':level,
    })
        .then((value) {
          postScoreModel = PostScoreModel.fromJson(value.data);
          emit(PostScoreSuccessState());
          print(postScoreModel!.data!.score.toString());
          print(postScoreModel!.status.toString());
        })
        .catchError((error) {
          print(error.toString());
          emit(PostScoreErrorState());
        });
  }
}