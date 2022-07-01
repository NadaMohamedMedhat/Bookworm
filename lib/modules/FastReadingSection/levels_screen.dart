import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/HomeScreen/cubit/layout_cubit.dart';
import 'package:graduation_project/modules/HomeScreen/cubit/layout_states.dart';

import '../../widgets/reusable_components.dart';
import 'FristLevel/first_level_screen.dart';
import 'SecondLevel/second_level_screen.dart';
import 'ThirdLevel/third_level_screen.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: LayoutCubit.get(context).isDark
                ? Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).backgroundColor),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CategoryItem('  المستوي الأول  ', context,
                              const FirstLevelScreen()),
                          const SizedBox(
                            height: 15,
                          ),
                          CategoryItem('  المستوي الثاني  ', context,
                              const SecondLevelScreen()),
                          const SizedBox(
                            height: 15,
                          ),
                          CategoryItem('  المستوي الثالث  ', context,
                              const ThirdLevelScreen()),
                        ],
                      ),
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            firstColor,
                            thirdColor,
                          ]),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CategoryItem('  المستوي الأول  ', context,
                              const FirstLevelScreen()),
                          const SizedBox(
                            height: 15,
                          ),
                          CategoryItem('  المستوي الثاني  ', context,
                              const SecondLevelScreen()),
                          const SizedBox(
                            height: 15,
                          ),
                          CategoryItem('  المستوي الثالث  ', context,
                              const ThirdLevelScreen()),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

Widget CategoryItem(String cat, context, Widget screenLevel) {
  return InkWell(
    onTap: () {
      navigateToAndBurn(context, screenLevel);
    },
    child: Container(
      width: 200,
      height: 53,
      //margin: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
          color: fourthColor,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Center(
        child: Text(
          cat,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: fifthColor),
        ),
      ),
    ),
  );
}
