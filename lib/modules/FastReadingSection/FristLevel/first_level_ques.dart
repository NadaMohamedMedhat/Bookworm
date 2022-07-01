// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/FastReadingSection/AnswerQuestionsCubit/cubit/post_score_cubit.dart';
import 'package:graduation_project/modules/FastReadingSection/AnswerQuestionsCubit/cubit/post_score_states.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/Profile_states.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/profile_cubit.dart';

import '../../../widgets/reusable_components.dart';
import '../levels_screen.dart';

class FirstLevelQuestions extends StatefulWidget {
  const FirstLevelQuestions({Key? key}) : super(key: key);

  @override
  _FirstLevelQuestionsState createState() => _FirstLevelQuestionsState();
}

class _FirstLevelQuestionsState extends State<FirstLevelQuestions> {
  // ignore: non_constant_identifier_names
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  int scoreLevel = 1;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: PageView.builder(
              controller: _controller!,
              onPageChanged: (page) {
                if (page == questions.length - 1) {
                  setState(() {
                    btnText = "See Results";
                  });
                }
                setState(() {
                  answered = false;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text("Question ${index + 1}/10",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Divider(
                      color: secondColor,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 150.0,
                      child: Text("${questions[index].question}",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    for (int i = 0; i < questions[index].answers!.length; i++)
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: secondColor, width: 2)),
                        width: double.infinity,
                        height: 50.0,
                        margin: const EdgeInsets.only(
                            bottom: 20.0, left: 12.0, right: 12.0),
                        child: RawMaterialButton(
                          shape: const RoundedRectangleBorder(
                          ),
                          fillColor: btnPressed
                              ? questions[index].answers!.values.toList()[i]
                                  ? Colors.green
                                  : Colors.red
                              : secondColor,
                          onPressed: !answered
                              ? () {
                                  if (questions[index]
                                      .answers!
                                      .values
                                      .toList()[i]) {
                                    score++;
                                    // ignore: avoid_print
                                    print("yes");
                                  } else {
                                    // ignore: avoid_print
                                    print("no");
                                  }
                                  setState(() {
                                    btnPressed = true;
                                    answered = true;
                                  });
                                }
                              : null,
                          child: Text(
                              questions[index].answers!.keys.toList()[i],
                              style: Theme.of(context).textTheme.subtitle1),
                        ),
                      ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    BlocConsumer<ProfileCubit, ProfileStates>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return BlocConsumer<PostScoreCubit, PostScoreStates>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return RawMaterialButton(
                              onPressed: () {
                                print(score);
                                if (_controller!.page?.toInt() ==
                                    questions.length - 1) {
                                  PostScoreCubit.get(context).postUserScore(
                                      ProfileCubit.get(context).id.toString(),
                                      score.toString(),
                                      scoreLevel.toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResultScreen(score)));
                                } else {
                                  _controller!.nextPage(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      curve: Curves.easeInExpo);

                                  setState(() {
                                    btnPressed = false;
                                  });
                                }
                              },
                              shape: const StadiumBorder(),
                              fillColor: thirdColor,
                              padding: const EdgeInsets.all(18.0),
                              elevation: 0.0,
                              child: Text(
                                btnText,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                );
              },
              itemCount: questions.length,
            )),
      ),
    );
  }
}

List<QuestionModel> questions = [
  QuestionModel(
    "بدات رحله التسابق في الوصول للفضاء خلال فتره",
    {
      "الحرب العالمية الاولي": false,
      "الحرب العالمية الثانية": false,
      "الحرب البارده": true,
      "حرب الخليج": false,
    },
  ),
  QuestionModel("اول قمر صناعي اطلق من قبل", {
    "الولايات المتحدة الأمريكية": false,
    "الأتحاد الأوربي": false,
    "الصين": false,
    "الأتحاد السوفيتي": true,
  }),
  QuestionModel("تم إطلاق أول قمر صناعي عام", {
    "1956 م": false,
    "1957 م": true,
    "1958 م": false,
    "1959 م": false,
  }),
  QuestionModel("أول رحلة فضاء بشرية كانت بقيادة رائد الفضاء", {
    "آلان شيبارد": false,
    "يوجين سيرنان": false,
    "يوري جاجارين": true,
    "ديفيد سكوت": false,
  }),
  QuestionModel(
      "تأسست الإدارة الوطنية للملاحة الجوية و الفضاء في الولايات المحتدة الامريكية",
      {
        "صح": true,
        "غلط": false,
        //"The hot planet": false,
        //"The smelly planet": false,
      }),
  QuestionModel("يطلق علي الإدراة الوطنية للملاحة الجوية و الفضاء اسم", {
    "NESA": false,
    "NASE": false,
    "NASA": true,
    "NISA": false,
  }),
  QuestionModel(
      "أجمعت الدول العاملة في مجال الفضاء علي بناء و تشغيل محطة فضاء دولية أطلقوا عليها",
      {
        "NASA": false,
        "IOT": false,
        "SIS": false,
        "ISS": true,
      }),
  QuestionModel("تم إنطلاق محطة الفضاء الدولية عام 1997 م", {
    "صح": false,
    //"Third": false,
    "غلط": true,
    //"Sixth": false,
  }),
  QuestionModel(
      "بعد دخول القطاع الخاص في صناعة الأقمار الصناعية أخذت الرحلات طابع", {
    "صناعي": false,
    "علمي": false,
    "تجاري": true,
    "عسكري": false,
  }),
  QuestionModel("من اكتشافات الفضاء العلمية التعرف علي طبوغرافية الأرض", {
    "صح": true,
    "غلط": false,
  }),
];

class QuestionModel {
  String? question;
  Map<String, bool>? answers;
  QuestionModel(this.question, this.answers);
}

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  int score;

  ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    String resultText = 'You tried it';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                  widget.score < 5
                      ? resultText.toString()
                      : resultText = 'Congratulations you did it',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!),
            ),
            const SizedBox(
              height: 45.0,
            ),
            Text("Your Score is",
                style: Theme.of(context).textTheme.subtitle1!),
            const SizedBox(
              height: 20.0,
            ),
            Text("${widget.score}",
                style: Theme.of(context).textTheme.subtitle1!),
            const SizedBox(
              height: 100.0,
            ),
            // FlatButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const LevelsScreen(),
            //         ));
            //   },
            //   shape: const StadiumBorder(),
            //   color: thirdColor,
            //   padding: const EdgeInsets.all(18.0),
            //   child: const Text(
            //     "Back to choose level",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
