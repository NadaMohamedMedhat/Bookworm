import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/wantToReadModel.dart';
import 'package:graduation_project/modules/want_to_read_screen/cubit/want_to_read_states.dart';
import 'package:graduation_project/network/Remote%20network/dio_helper.dart';
import 'package:graduation_project/network/Remote%20network/end_points.dart';

class GetWantToReadBooksCubit extends Cubit<GetWantToReadBooksStates> {
  GetWantToReadBooksCubit() : super(GetWantToReadInitialState());

  static GetWantToReadBooksCubit get(context) => BlocProvider.of(context);

  WantToReadModel? wantToReadModel;
  int? id;
  List? myList;

  void getWantToReadBooks(dynamic uID) {
    emit(GetWantToReadBooksLoadingState());
    DioHelper.getWantToReadData(path: GETWANTTOREAD, uID: uID).then((value) {
      wantToReadModel = WantToReadModel.fromJson(value.data);
      id = wantToReadModel!.data!.where((element) => element.id == 71).toList().length;
      print(id);
      // myList=wantToReadModel!.data;
      // todo(){return myList.contains(element){ Add;}}

      // if()
      // myList = [
      //   ...{...?wantToReadModel!.data}
      // ];
      // var ids = myList!.map((e) => e.documentID).toSet();
      // myList!.retainWhere((x) => ids.remove(x.documentID));

      print(wantToReadModel!.data![0].carts!.name.toString());
      print(wantToReadModel!.status.toString());
      emit(GetWantToReadBooksSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetWantToReadBooksErrorState());
    });
  }
}
