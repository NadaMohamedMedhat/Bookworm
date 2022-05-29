import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_cubit.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';
import 'package:graduation_project/widgets/book_item.dart';
import 'package:graduation_project/widgets/reusable_components.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen(
      {Key? key,
      required this.title,
      required this.screenNav,
      required this.itemsNumber,
      required this.listNumber})
      : super(key: key);

  final String title;
  final dynamic screenNav;
  final int itemsNumber;
  final int listNumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: fourthColor,
              elevation: 0,
              title: Text(title, style: const TextStyle(overflow: TextOverflow.clip),),
            ),
            body: ConditionalBuilder(
                condition: state is HomeGetDataSuccessState,
                builder: (context) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView.separated(
                          itemBuilder: (ctxx, index) => CategoryBookItem(
                              HomeCubit.get(context)
                                  .homeModel!
                                  .data![index + listNumber],
                              context,
                              screenNav
                              //ScientificBookDetailsScreen.routePass
                              ),
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
                          itemCount: itemsNumber),
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
