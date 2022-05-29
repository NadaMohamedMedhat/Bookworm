// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../widgets/reusable_components.dart';
import '../levels_screen.dart';


class ThirdLevelQuestions extends StatefulWidget {
  const ThirdLevelQuestions({Key? key}) : super(key: key);

  @override
  _ThirdLevelQuestionsState createState() => _ThirdLevelQuestionsState();
}

class _ThirdLevelQuestionsState extends State<ThirdLevelQuestions> {
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
              if (page == thirdQuestions.length - 1) {
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
                      "${thirdQuestions[index].question}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  for (int i = 0;
                      i < thirdQuestions[index].answers!.length;
                      i++)
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
                            ? thirdQuestions[index].answers!.values.toList()[i]
                                ? Colors.green
                                : Colors.red
                            : secondColor,
                        onPressed: !answered
                            ? () {
                                if (thirdQuestions[index]
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
                            thirdQuestions[index].answers!.keys.toList()[i],
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
                      if (_controller!.page?.toInt() ==
                          thirdQuestions.length - 1) {
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
            itemCount: thirdQuestions.length,
          )),
    );
  }
}

List<QuestionModel> thirdQuestions = [
  QuestionModel(
    "يحدث خلل في متلازمة داون في الكروموسوم",
    {
      "23": false,
      "18": false,
      "21": true,
      "46": false,
    },
  ),
  QuestionModel("أطفال داون معرضون في مرحلة الطفولة لإصابة بــ", {
    "الزهايمر": false,
    "سرطان الدم": true,
    "أرتفاع ضغط الدم": false,
    "صداع دائم": false,
  }),
  QuestionModel("ما النوع الأكثر شيوعا في متلازمة داون", {
    "الفسيفسائي ": false,
    "الانتقالي الصبغي": false,
    "التثلث الصبغي 21": true,
    "الثلاثة معنا": false,
  }),
  QuestionModel("يعاني المصاب بمتلازمة داون بالضعف العضلي في", {
    "عضلات الجسم بشكل عام": true,
    "عضلات الرقبة فقط": false,
    "عضلات الأطراف السفلية فقط": false,
    "عضلات الأطراف العلوية فقط": false,
  }),
  QuestionModel("من المشاكل الصحية التي يعاني منها مصابون داون", {
    "التأخر في التدريب علي الأخراج": false,
    "وبات الغضب و العناد": false,
    "عيوب خلقية في القلب و الأمعاء": true,
    "السمع بشكل قوي": false,
  }),
  QuestionModel("انقطاع النفس انثاء النوم أحد الاعراض", {
    "الجسدية": false,
    "النفسية": false,
    "الإدراكية": false,
    "الصحية": true,
  }),
  QuestionModel("تتكون الخلية البشرية السليمة من", {
    "35 كروموسوم": false,
    "54 كروموسوم": false,
    "46 كروموسوم": true,
    "21 كروموسوم": false,
  }),
  QuestionModel("يوجد علاج نهائي لمنع الإصابة بمتلازمة داون", {
    "صح": false,
    "غلط": true,
  }),
  QuestionModel(
      "قد يكون أحد الآباء حاملا للخلل الكروموسومي دون ظهور اي اعراض عليه", {
    "صح": true,
    "غلط": false,
  }),
  QuestionModel(
      "في غالب الأحيان تكون القدرة العقلية و الذهنية للمصابين بين خفيفة و متوسطة",
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
  String resultText = 'You tried it';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: Column(
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
