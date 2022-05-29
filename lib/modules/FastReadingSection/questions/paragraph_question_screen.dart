import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/reusable_components.dart';
import 'questions_cubit.dart';


class ParagraphQuestionsScreen extends StatelessWidget {
  //const ParagraphQuestionsScreen({Key? key}) : super(key: key);
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller = PageController(initialPage: 0);
  // }
  @override
  Widget build(BuildContext context) {
    var _indexQuestion = 0;
    double _totalScore = 0.00;
    return BlocConsumer<QuestionsCubit, QuestionsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          //backgroundColor:fourthColor,
          appBar: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text("Solve the folowing questions",
                  style: Theme.of(context).textTheme.subtitle2),
            ),
            backgroundColor: fourthColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ConditionalBuilder(
                  condition: state is GetQuestionSuccessState,
                  builder: (context) => Text(QuestionsCubit.get(context).getQuestion(1).answer!.question.toString())
              //     ListView.builder(
              //       scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              //         itemBuilder: (context, index) => ques(context , QuestionsCubit.get(context).getQuestion(1)),
              //         //separatorBuilder: (context, i) => Container(),
              //         itemCount: 1)
                  //  Align(
                  //     alignment: Alignment.center,
                  //     child: Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Text(
                  //        QuestionsCubit.get(context).questionsModel!.question![2].question.toString(),
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 22.0,
                  //       ),
                  //     ),
                  //             // Text(
                  //             //   QuestionsCubit.get(context)
                  //             //       .questionsModel!
                  //             //       .question![_indexQuestion]
                  //             //       .id
                  //             //       .toString(),
                  //             //   style: Theme.of(context).textTheme.subtitle2,
                  //             // ),
                  //             // Text(
                  //             //   QuestionsCubit.get(context)
                  //             //       .questionsModel!
                  //             //       .question![_indexQuestion]
                  //             //       .question
                  //             //       .toString(),
                  //             //   style: Theme.of(context).textTheme.subtitle2,
                  //             // ),
                  //           ],
                  //         ),
                  //       ],
                  //     )
                  //     // (_indexQuestion <= 9 && _indexQuestion >= 0)
                  //     //     ? Quiz(
                  //     //         answerQuestion: _answerQuestion,
                  //     //         indexQuestion: _indexQuestion,
                  //     //         data: {})
                  //     //     : Result(_totalScore, _restart)
                  //     ),
                  ,
                  fallback: (context) => const Center(
                    child: Image(
                      image: AssetImage('assets/images/loading.gif'),
                      height: 90,
                      width: 90,
                    ),
                  ),
                ),
                // BlocConsumer<AnswersCubit, AnswersState>(
                //   listener: (context, state) {
                //     // TODO: implement listener
                //   },
                //   builder: (context, state) {
                //     return ConditionalBuilder(
                //       condition: state is GetAnswersSuccessState,
                //       builder: (
                //         context,
                //       ) =>
                //           Column(
                //         children: [
                //           Row(
                //             children: [
                //               Text(
                //                 AnswersCubit.get(context)
                //                     .answersModel!
                //                     .answer![_indexQuestion]
                //                     .id
                //                     .toString(),
                //                 style: Theme.of(context).textTheme.subtitle2,
                //               ),
                //               Text(
                //                 AnswersCubit.get(context)
                //                     .answersModel!
                //                     .answer![_indexQuestion]
                //                     .answer
                //                     .toString(),
                //                 style: Theme.of(context).textTheme.subtitle2,
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //       fallback: (context) => const Center(
                //         child: Image(
                //           image: AssetImage('assets/images/loading.gif'),
                //           height: 90,
                //           width: 90,
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Questions extends StatelessWidget {
  final String textQuestion;

  const Questions(this.textQuestion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: SizedBox(
            width: 360,
            child: Text(textQuestion,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2)));
  }
}

class Quiz extends StatelessWidget {
  final Map<String, Object> data;
  final int indexQuestion;
  final Function answerQuestion;

  const Quiz(
      {required this.data,
      required this.answerQuestion,
      required this.indexQuestion,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: 360,
              child:
                  Questions('' //data[indexQuestion]['questionText'] as String,
                      ),
            )),
        //''// ...(data[indexQuestion]['answers'] as List<Map<String, Object>>)
        //     .map((answer) {
        //   return Answer(
        //       () => answerQuestion(answer['score']), answer['text'] as String);
        // }
        //).toList(),
      ],
    );
  }
}

void _answerQuestion(double score) {
  //_totalScore += score;

  // setState(() {
  //  _indexQuestion += 1;
  //  });
}

class Result extends StatelessWidget {
  final double resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    final score = num.parse(resultScore.toStringAsFixed(2));

    if (score <= 10.00) {
      resultText = 'You tried it and scored $score % 🤎! \n Want to try again?';
    } else if (score > 15.00 && score <= 50.00) {
      resultText = 'You did it and scored $score % 🤎! \n Want to try again?';
    } else if (score > 50.00 && score <= 75.00) {
      resultText = 'You got it and scored $score % 🤎! \n Want to try again?';
    } else {
      resultText =
          'You nailed it and scored $score % 🤎! \n Want to try again?';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: 360,
                      child: Questions(
                        resultPhrase,
                      ),
                    )),
                ElevatedButton(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      'Try again',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: fifthColor,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(secondColor)),
                  onPressed: resetHandler,
                )
              ],
            )));
  }
}

void _restart() {
  // setState(() {
  //   _indexQuestion = 0;
  //   _totalScore = 0;
  // });
}

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
//       style:
//           ButtonStyle(backgroundColor: MaterialStateProperty.all(fourthColor)),
//       onPressed: selectHandler,
//     );
//   }
// }

Widget ques(context,   model) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: double.infinity,
        child: Text(
          "Question index + 1}/10",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
      Divider(
        color: Colors.white,
      ),
      SizedBox(
        height: 10.0,
      ),
      SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Text(
          model.question.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
      ),
      // for (int i = 0; i < QuestionsCubit.get(context).questionsModel!.question![index].question!.length; i++)
      //   Container(
      //     width: double.infinity,
      //     height: 50.0,
      //     margin: EdgeInsets.only(
      //         bottom: 20.0, left: 12.0, right: 12.0),
      //     child: RawMaterialButton(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(8.0),
      //       ),
      //       //fillColor: btnPressed
      //         //  ?
      //           //QuestionsCubit.get(context).questionsModel!.question![index]
      //             //  ? Colors.green
      //               //: Colors.red
      //           //: secondColor,
      //       onPressed: !answered
      //           ? () {
      //               // if (QuestionsCubit.get(context).questionsModel!.question![index]
      //               //     .answers!
      //               //     .values
      //               //     .toList()[i]) {
      //               //   score++;
      //               //   print("yes");
      //               // } else {
      //               //   print("no");
      //               // }
      //               // setState(() {
      //               //   btnPressed = true;
      //               //   answered = true;
      //               // }
      //               //);
      //             }
      //           : null,
      //       child: Text(QuestionsCubit.get(context).questionsModel!.question![index].question!,
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 18.0,
      //           )),
      //     ),
      //   ),
      // SizedBox(
      //   height: 40.0,
      // ),
      // RawMaterialButton(
      //   onPressed: () {
      //     if (_controller!.page?.toInt() == QuestionsCubit.get(context).questionsModel!.question!.length - 1) {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => Container()));
      //               //ResultScreen(score)));
      //     } else {
      //       _controller!.nextPage(
      //           duration: Duration(milliseconds: 250),
      //           curve: Curves.easeInExpo);

      //       // setState(() {
      //       //   btnPressed = false;
      //       // });
      //     }
      //   },
      //   shape: StadiumBorder(),
      //   fillColor: Colors.blue,
      //   padding: EdgeInsets.all(18.0),
      //   elevation: 0.0,
      //   child: Text(
      //     btnText,
      //     style: TextStyle(color: Colors.white),
      //   ),
      // )
    ],
  );
}
