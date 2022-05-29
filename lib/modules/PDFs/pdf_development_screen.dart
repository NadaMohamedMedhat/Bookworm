import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_cubit.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';


class PDFDevelopmentScreen extends StatelessWidget {
  static const routePass = 'PDFDevelopmentbookScreen';
  @override
  Widget build(BuildContext context) {
    final bookId = ModalRoute.of(context)!.settings.arguments as int;
    var model = HomeCubit.get(context).homeModel!.data;
    final selecteBook = model!.firstWhere((element) => element.id == bookId);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: PDF(
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: false,
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
          ).cachedFromUrl(
            selecteBook.url!,
            placeholder: (double progress) => Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/pdfLoading.gif'),
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  '$progress %',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            )),
            errorWidget: (dynamic error) =>
                Center(child: Text(error.toString())),
          ),
        );
      },
    );
  }
}
