import 'package:flutter/material.dart';

import '../../widgets/reusable_components.dart';
import 'FristLevel/first_level_screen.dart';
import 'SecondLevel/second_level_screen.dart';
import 'ThirdLevel/third_level_screen.dart';


class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(backgroundColor: secondColor,
      elevation: 0.0,
        title: Text(
          'اختر المستوي',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white,fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          CategoryItem('  المستوي الأول  ', context, const FirstLevelScreen()),
          CategoryItem('  المستوي الثاني  ', context, const SecondLevelScreen()),
          CategoryItem('  المستوي الثالث  ', context, const ThirdLevelScreen()),
        ],
      ),
    );
  }
}

Widget CategoryItem(String cat, context, Widget screenLevel) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          navigateToAndBurn(context, screenLevel);
        },
        child: Container(
          width: double.infinity,
          height: 80,
          margin: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(Icons.arrow_left_outlined),
                  const Spacer(),
                  Text(
                    cat,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}
