// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../widgets/reusable_components.dart';
import '../levels_screen.dart';


// class QuistionsScreen extends StatefulWidget {
//   const QuistionsScreen({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _QuistionsScreenState();
//   }
// }

// class _QuistionsScreenState extends State<QuistionsScreen> {
//   static const _data = [
//     {
//       'questionText':
//           'يحدث خلل في مثلازمة داون في الكروموسوم',
//       'answers': [
//         {'text': '23', 'score': 0.0},
//         {'text': '18', 'score': 0.0},
//         {'text': '21', 'score': 10.0},
//         {'text': '46', 'score': 0.0},
//       ]
//     },
//     {
//       'questionText':
//           'أطفال داون معرضون في مرحلة الطفولة لإصابة ب',
//       'answers': [
//         {'text': 'الزهايمر', 'score': 0.0},
//         {'text': 'سرطان الدم', 'score': 10.0},
//         {'text': 'أرتفاع ضغط الدم', 'score': 0.0},
//         {'text': 'صداع دائم', 'score': 0.0},
//       ]
//     },
//     {
//       'questionText': 'ما النوع الأكثر شيوعا في متلازمة داون',
//       'answers': [
//         {'text': 'الفسيفسائي', 'score': 0.0},
//         {'text': 'التثلث الصبغي 2', 'score': 10.0},
//         {'text': 'الانتقالي الصبغي', 'score': 0.0},
//         {'text': 'الثلاثة معنا', 'score': 0.0}
//       ]
//     },
//     {
//       'questionText': 'يعاني المصاب بمتلازمة داون بالضعف العضلي في',
//       'answers': [
//         {'text': 'عضلات الأطراف السفلية فقط', 'score': 0.0},
//         {'text': 'عضلات الأطراف العلوية فقط', 'score': 0.0},
//         {'text': 'عضلات الجسم بشكل عام', 'score': 10.0},
//         {'text': 'عضلات الرقبة فقط', 'score': 0.0}
//       ]
//     },
//     {
//       'questionText': 'من المشاكل الصحية التي يعاني منها مصابون داون',
//       'answers': [
//         {'text': 'التأخر في التدريب علي الأخراج', 'score': 0.0},
//         {'text': 'وبات الغضب و العناد', 'score': 0.0},
//         {'text': 'عيوب خلقية في القلب و الأمعاء', 'score': 10.0},
//         {'text': 'السمع بشكل قوي', 'score': 0.0}
//       ]
//     },
//     {
//       'questionText': 'انقطاع النفس انثاء النوم أحد الاعراض',
//       'answers': [
//         {'text': 'الجسدية', 'score': 0.0},
//         {'text': 'النفسية', 'score': 0.0},
//         {'text': 'الصحية', 'score': 10.0},
//         {'text': 'الإدراكية', 'score': 0.0}
//       ]
//     },
//     {
//       'questionText': 'تتكون الخلية البشرية السليمة من',
//       'answers': [
//         {'text': 'كروموسوم35', 'score': 0.0},
//         {'text': '54كروموسوم', 'score': 0.0},
//         {'text': '46كروموسوم', 'score': 10.0},
//         {'text': '21كروموسوم', 'score': 0.0}
//       ]
//     },
//     {
//       'questionText': 'يوجد علاج نهائي لمنع الإصابة بمتلازمة داون',
//       'answers': [
//         {'text': 'صح', 'score': 0.0},
//         {'text': 'غلط', 'score': 10.0},
//         //{'text': 'الصحية', 'score': 10.0},
//         //{'text': 'الإدراكية', 'score': 0.0}
//       ]
//     },
//     {
//       'questionText': 'في غالب الأحيان تكون القدرة العقلية و الذهنية للمصابين بين خفيفة و متوسطة',
//       'answers': [
//         {'text': 'صح', 'score': 10.0},
//         {'text': 'غلط', 'score': 0.0},
//        // {'text': 'الصحية', 'score': 10.0},
//         //{'text': 'الإدراكية', 'score': 0.0}
//       ]
//     },
//     {
//       'questionText': 'قد يكون أحد الآباء حاملا للخلل الكروموسومي دون ظهور اي اعراض عليه',
//       'answers': [
//         {'text': 'صح', 'score': 10.0},
//         {'text': 'غلط', 'score': 0.0},
//         // {'text': 'الصحية', 'score': 10.0},
//         // {'text': 'الإدراكية', 'score': 0.0}
//       ]
//     },

//   ];

//   var _indexQuestion = 0;
//   double _totalScore = 0.00;

//   void _answerQuestion(double score) {
//     _totalScore += score;

//     setState(() {
//       _indexQuestion += 1;
//     });
//   }

//   void _restart() {
//     setState(() {
//       _indexQuestion = 0;
//       _totalScore = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           //backgroundColor:fourthColor,
//           appBar: AppBar(
//             title: const Align(
//               alignment: Alignment.center,
//               child: Text(
//                 "Solve the folowing questions",
//                 style: TextStyle(
//                   color: fifthColor,
//                 ),
//               ),
//             ),
//             backgroundColor:fourthColor,
//           ),
//           body: Align(
//               alignment: Alignment.center,
//               child: (_indexQuestion <= 9 && _indexQuestion >= 0)
//                   ? Quiz(
//                       answerQuestion: _answerQuestion,
//                       indexQuestion: _indexQuestion,
//                       data: _data)
//                   : Result(_totalScore, _restart))),
//     );
//   }
// }

// class Quiz extends StatelessWidget {
//   final List<Map<String, Object>> data;
//   final int indexQuestion;
//   final Function answerQuestion;

//   const Quiz(
//       {required this.data,
//       required this.answerQuestion,
//       required this.indexQuestion,
//       Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//             padding: const EdgeInsets.only(bottom: 32),
//             child: SizedBox(
//               width: 360,
//               child: Question(
//                 data[indexQuestion]['questionText'] as String,
//               ),
//             )),
//         ...(data[indexQuestion]['answers'] as List<Map<String, Object>>)
//             .map((answer) {
//           return Answer(
//               () => answerQuestion(answer['score']), answer['text'] as String);
//         }).toList(),
//       ],
//     );
//   }
// }

// class Result extends StatelessWidget {
//   final double resultScore;
//   final VoidCallback resetHandler;

//   const Result(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);

//   String get resultPhrase {
//     String resultText;
//     final score = num.parse(resultScore.toStringAsFixed(2));

//     if (score <= 10.00) {
//       resultText =
//           'You tried it and scored $score % 🤎! \n Want to try again?';
//     } else if (score > 15.00 && score <= 50.00) {
//       resultText =
//           'You did it and scored $score % 🤎! \n Want to try again?';
//     } else if (score > 50.00 && score <= 75.00) {
//       resultText =
//           'You got it and scored $score % 🤎! \n Want to try again?';
//     } else {
//       resultText =
//           'You nailed it and scored $score % 🤎! \n Want to try again?';
//     }

//     return resultText;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Align(
//             alignment: Alignment.center,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.only(bottom: 32),
//                     child: SizedBox(
//                       width: 360,
//                       child: Question(
//                         resultPhrase,
//                       ),
//                     )),
//                 ElevatedButton(
//                   child: SizedBox(
//                     width: 200,
//                     child: Text(
//                       'Try again',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: fifthColor,
//                       ),
//                     ),
//                   ),
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(secondColor)),
//                   onPressed: resetHandler,
//                 )
//               ],
//             )));
//   }
// }

// class Question extends StatelessWidget {
//   final String textQuestion;

//   const Question(this.textQuestion, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.only(bottom: 32),
//         child: SizedBox(
//             width: 360,
//             child: Text(textQuestion,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20,
//                   color: fifthColor,
//                 ))));
//   }
// }

// class Answer extends StatelessWidget {
//   final VoidCallback selectHandler;
//   final String answerText;

//   const Answer(this.selectHandler, this.answerText, {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: SizedBox(
//         width: 200,
//         child: Text(
//           answerText,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontWeight: FontWeight.w400,
//             color: fifthColor,
//           ),
//         ),
//       ),
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(fourthColor)),
//       onPressed: selectHandler,
//     );
//   }
// }

class FirstLevelQuestions extends StatefulWidget {
  const FirstLevelQuestions({Key? key}) : super(key: key);

  @override
  _FirstLevelQuestionsState createState() => _FirstLevelQuestionsState();
}

class _FirstLevelQuestionsState extends State<FirstLevelQuestions> {
  // ignore: non_constant_identifier_names
  int question_pos = 0;
  int score = 0;
  //String resultText = 'You tried it';
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
                      "${questions[index].question}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  for (int i = 0; i < questions[index].answers!.length; i++)
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
                        child: Text(questions[index].answers!.keys.toList()[i],
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
                      if (_controller!.page?.toInt() == questions.length - 1) {
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
            itemCount: questions.length,
          )),
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
