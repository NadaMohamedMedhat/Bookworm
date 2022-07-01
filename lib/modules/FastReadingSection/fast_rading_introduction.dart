import 'package:flutter/material.dart';

import '../../widgets/reusable_components.dart';
import 'levels_screen.dart';

class FastReadingIntroductionScreen extends StatelessWidget {
  const FastReadingIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/fast.png'),
                    width: double.infinity,
                    height: 250,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ما هو تحدي القراءة السريعة',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Builder(
                        builder: (context) {
                          return Text(
                              'القراءة ضرورية للحياة ، فهي كالماء والغذاء . فالجسم الذي ينقطع عنه الماء والغذاء يمرض ويموت ، وكذلك العقل فهو بحاجة إلى الغذاء ، وغذاء العقل هو القراءة . القراءة بالطرق التقليدية أصبحت لا تجدي نفعاً كبيراً ، مقارنة بالأشخاص الذين يجيدون القراءة السريعة ، لأن الطرق التقليدية متوسط سرعة القراءة فيها هو ( 175 ) كلمة في الدقيقة ، أما القراءة السريعة فيصل إلى أكثر من ( 750 ) كلمة في الدقيقة ، وقد يصل إلى ( 1000 ) كلمة ، وهناك البعض تجاوز الألف كلمة في الدقيقة . يقدر العلماء بأن ( 80-90 % من المعلومات التي نحصل عليها تأتي من القراءة ، لذا تتطلب الحياة وبشكل مستمر اتباع أساليب جديدة في القراءة . سواء أكنت محترفاً في عملك ، أم طالباً ، أو كنت تعمل في المنزل ، أو تبحث عن وظيفة ومستقبل مرموق .',
                              style: Theme.of(context).textTheme.subtitle2);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                thirdColor,
                                firstColor,
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: TextButton(
                        onPressed: () {
                          navigateTo(context, const LevelsScreen());
                        },
                        child: const Text('ابدأ التحدي الان',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: fourthColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
