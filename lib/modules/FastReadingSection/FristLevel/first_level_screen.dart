import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timer_count_down/timer_count_down.dart';

import '../../../widgets/reusable_components.dart';
import 'cubit/paragraph_cubit.dart';
import 'first_level_ques.dart';

class FirstLevelScreen extends StatelessWidget {
  const FirstLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParagraphCubit, ParagraphState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Column(
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
                  child: Counter(nextScreen: FirstLevelQuestions(), seconds: 420),
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
          ),
        );
      },
    );
  }
}

Widget paragraphText(model, context) {
  return Row(
    children: [
      Text(
        model.paragraph.toString(),
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ],
  );
}

class Counter extends StatelessWidget {
  final Widget nextScreen;
  final int seconds;

  const Counter({Key? key, required this.nextScreen, required this.seconds})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: seconds,
      build: (BuildContext context, double time) => Padding(
        padding: const EdgeInsetsDirectional.only(top: 20),
        child: Text(
          time.toString(),
          style: const TextStyle(color: fourthColor, fontSize: 27),
        ),
      ),
      interval: const Duration(milliseconds: 100),
      onFinished: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => nextScreen),
            (route) => route.isFirst);
        //navigateToAndBurn(context, nextScreen);
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
                          .paragraph![1]
                          .name
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: fifthColor),
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
                          .paragraph![1]
                          .paragraph
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: fifthColor),
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
