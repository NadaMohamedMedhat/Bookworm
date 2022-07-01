import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/BooksScreen/book_details_screen.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_cubit.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';

import 'package:graduation_project/widgets/book_item.dart';

import '../../widgets/reusable_components.dart';

class ThrillerBooksScreen extends StatelessWidget {
  const ThrillerBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = HomeCubit.get(context).homeModel;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('Thrillers Books',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 32)),
            ),
            body: ConditionalBuilder(
                condition: state is! HomeGetDataLoadingState,
                builder: (context) => Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView.separated(
                            itemBuilder: (ctxx, index) => CategoryBookItem(
                                data!.data![index + 7],
                                context,
                                BookDetailsScreen.routePass),
                            separatorBuilder: (context, index) => Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    start: 20.0,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                ),
                            itemCount: 3),
                      ),
                    ),
                fallback: (context) => const Center(
                      child: Image(
                        image: AssetImage('assets/images/loading.gif'),
                        height: 90,
                        width: 90,
                      ),
                    )));
      },
    );
  }
}
