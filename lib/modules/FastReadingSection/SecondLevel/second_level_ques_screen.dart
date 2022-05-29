// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../widgets/reusable_components.dart';
import '../levels_screen.dart';


class SecondLevelQuestions extends StatefulWidget {
  const SecondLevelQuestions({Key? key}) : super(key: key);

  @override
  _SecondLevelQuestionsState createState() => _SecondLevelQuestionsState();
}

class _SecondLevelQuestionsState extends State<SecondLevelQuestions> {
  // ignore: non_constant_identifier_names
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            controller: _controller!,
            onPageChanged: (page) {
              if (page == secondQuestions.length - 1) {
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
                    child: Text(
                      "Question ${index + 1}/10",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 150.0,
                    child: Text(
                      "${secondQuestions[index].question}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  for (int i = 0; i < secondQuestions[index].answers!.length; i++)
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: fifthColor, width: 2)),
                      width: double.infinity,
                      height: 50.0,
                      margin: const EdgeInsets.only(
                          bottom: 20.0, left: 12.0, right: 12.0),
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: btnPressed
                            ? secondQuestions[index].answers!.values.toList()[i]
                                ? Colors.green
                                : Colors.red
                            : secondColor,
                        onPressed: !answered
                            ? () {
                                if (secondQuestions[index]
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
                        child: Text(secondQuestions[index].answers!.keys.toList()[i],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      if (_controller!.page?.toInt() == secondQuestions.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(score)));
                      } else {
                        _controller!.nextPage(
                            duration: const Duration(milliseconds: 250),
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
                  )
                ],
              );
            },
            itemCount: secondQuestions.length,
          )),
    );
  }
}

List<QuestionModel> secondQuestions = [
  QuestionModel(
    "تعتبر الأهرامات محط اهتمام العديد من السياح من جميع انحاء العالم لــ",
    {
      "لوجودها في الصحراء": false,
      "لغناها بالنفط و المعادن": false,
      "مكانتها التاريخية": true,
      "جميع ما سبق": false,
    },
  ),
  QuestionModel(
      "تُعرف الأهرامات المصرية بأنها عبارة عن مباني هرمية الشكل ذات", {
    "قاعدة مثلثة و اربعة جدران مربعة الشكل": false,
    "قاعدة مربعة": false,
    "قاعدة مثلثة": false,
    "قاعدة مربعة و اربعة جدران مثلثة الشكل": true,
  }),
  QuestionModel("صنفت اليونسكو أهرامت الجيزة كــ", {
    "موقع مهجور": false,
    "أحد مواقع التراث العالمي": true,
    "موقع حديث النشأة": false,
    "ليس مما سبق": false,
  }),
  QuestionModel("تقع الأهرامات في جمهورية مصر العربية في", {
    "الجيزة": false,
    "سقارة": false,
    "دهشور": false,
    "جميع ما سبق": true,
  }),
  QuestionModel("يكمن الغرض من دفن الملوك الفراعة في الأهرامت لـــ", {
    "محافظتها علي درجة حرارة غرفة الدفن": true,
    "ابقائها كتذكار تاريخي": false,
    "ابقائهم عبرة لغيرهم من الملوك": false,
    "ليس مما سبق": false,
  }),
  QuestionModel("يعود تاريخ بناء الأهرامت إلي الفترة الواقعية ما بين", {
    "2000 و 3000 قبل الميلاد": false,
    "600 و 715 قبل الميلاد": false,
    "2575 و 2465 قبل الميلاد": true,
    "400 و 600 قبل الميلاد": false,
  }),
  QuestionModel("صمم هرم زوسر علي يد المهندس المعماري", {
    "هيرودوت": false,
    "دونالد ريدفورد": false,
    "سنفرو": false,
    "إمحوتب": true,
  }),
  QuestionModel("بلغ عدد أهرامات الجيزة", {
    "هرمان": false,
    "أربعة اهرامات": false,
    "ثلاثة أهرامات": true,
    "ثمانية أهرمات": false,
  }),
  QuestionModel("العامل الذين تولوا مهمة بناء الأهرامات هم", {
    "العبيد": false,
    "الأسياد": false,
    "الفلاحون": true,
    "المرتزقة": false,
  }),
  QuestionModel(
      "يعود تاريخ بناء هرم زوسر إلي الفترة الواقعة ما بين عامي 2630 و 2611 قبل الميلاد",
      {
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
      backgroundColor: secondColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(
            width: double.infinity,
            child: Text(
              widget.score < 5 ?
              resultText.toString(): resultText = 'Congratulations you did it',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 45.0,
          ),
          const Text(
            "Your Score is",
            style: TextStyle(color: Colors.white, fontSize: 34.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "${widget.score}",
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 85.0,
              fontWeight: FontWeight.bold,
            ),
          ),
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
    );
  }
}
