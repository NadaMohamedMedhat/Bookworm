import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/BooksScreen/scientific_screen.dart';
import 'package:graduation_project/modules/BooksScreen/book_details_screen.dart';
import 'package:graduation_project/modules/BooksScreen/book_screen.dart';
import 'package:graduation_project/modules/HomeScreen/cubit/layout_cubit.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/Profile_states.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/profile_cubit.dart';

import 'package:graduation_project/modules/home_layout/cubit/home_cubit.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';
import 'package:graduation_project/modules/BooksScreen/literature_books.dart';
import 'package:graduation_project/widgets/book_item.dart';
import '../../widgets/reusable_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(actions: [
              IconButton(
                              onPressed: () {
                                LayoutCubit.get(context).changeAppMode();
                              },
                              icon: const Icon(Icons.dark_mode)),
            ],
              elevation: 0.0,
              title: BlocConsumer<ProfileCubit, ProfileStates>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  return ConditionalBuilder(
                      condition: state is ProfileSuccessState,
                      builder: (context) => Text(
                          greetingMessage(
                              ProfileCubit.get(context).name.toString()),
                          style: Theme.of(context).textTheme.subtitle1));
                },
              ),
              centerTitle: true,
            ),
            //drawer: const MyDrawer(),
            body: ConditionalBuilder(
                condition: state is! HomeGetDataLoadingState,
                builder: (context) => Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Categories',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ), ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  HomeCategoryItem(
                                      context,
                                      const ScientificBooks(),
                                      'scientific books',
                                      'assets/images/scientific.webp'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  HomeCategoryItem(
                                      context,
                                      const LiteratureBooks(),
                                      'literature',
                                      'assets/images/lit.jpg'),
                                  HomeCategoryItem(
                                      context,
                                      const BooksScreen(
                                        title: 'Thrillers Books',
                                        itemsNumber: 3,
                                        listNumber: 7,
                                        screenNav: BookDetailsScreen.routePass,
                                      ),
                                      'Thrillers',
                                      'assets/images/thriller.webp'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  HomeCategoryItem(
                                      context,
                                      const BooksScreen(
                                        title: 'Self Development Books',
                                        itemsNumber: 6,
                                        listNumber: 0,
                                        screenNav: BookDetailsScreen.routePass,
                                      ),
                                      'Self Development',
                                      'assets/images/self.webp'),
                                ]),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'see also',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(
                                height: 17.0,
                              ),
                              Container(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  childAspectRatio: 1 / 1.77,
                                  children: List.generate(
                                      10,
                                      (index) => bookItem(
                                          HomeCubit.get(context)
                                              .homeModel!
                                              .data![index + 23],
                                          context)),
                                ),
                              ),
                            ])),
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

Widget HomeCategoryItem(context, Widget nextScreen, catName, catImage) {
  return InkWell(
    onTap: () {
      navigateTo(context, nextScreen);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image(
              image: AssetImage(catImage),
              height: 190,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            catName,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    ),
  );
}

String greetingMessage(user) {
  var timeNow = DateTime.now().hour;

  if (timeNow <= 12) {
    return 'Good Morning $user';
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return 'Good Afternoon $user';
  } else if ((timeNow > 16) && (timeNow < 20)) {
    return 'Good Evening $user';
  } else {
    return 'Good Night $user';
  }
}
