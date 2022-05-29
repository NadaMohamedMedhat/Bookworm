import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timer_count_down/timer_count_down.dart';

import '../../../widgets/reusable_components.dart';
import '../FristLevel/cubit/paragraph_cubit.dart';
import '../FristLevel/first_level_screen.dart';
import 'third_level_ques_screen.dart';

class ThirdLevelScreen extends StatelessWidget {
  const ThirdLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParagraphCubit, ParagraphState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: secondColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'اختبر سرعة قرائتك',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 15,
              ),
              const CircleAvatar(
                backgroundColor: thirdColor,
                radius: 70,
                child: Counter(nextScreen: ThirdLevelQuestions(), seconds: 3),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical, //.horizontal
                    child: ConditionalBuilder(
                      condition: state is GetParagraphSuccessState,
                      builder: (context) => myParagraph(),
                      fallback: (context) => const Center(
                        child: Image(
                          image: AssetImage('assets/images/loading.gif'),
                          height: 90,
                          width: 90,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}

Widget myParagraph() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Card(
      margin: const EdgeInsets.all(9),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                    child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Builder(builder: (context) {
                    return Text(
                      ParagraphCubit.get(context)
                          .paragraphModel!
                          .paragraph![3]
                          .name
                          .toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    );
                  }),
                ))
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Builder(builder: (context) {
                    return Text(
                      ParagraphCubit.get(context)
                          .paragraphModel!
                          .paragraph![3]
                          .paragraph
                          .toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    );
                  }),
                ))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
