import 'package:flutter/material.dart';

import 'package:graduation_project/models/onBoarding_model.dart';
import 'package:graduation_project/modules/Login_Screen/login_screen.dart';
import 'package:graduation_project/network/local_network/Cache_Helper.dart';
import 'package:graduation_project/widgets/boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/reusable_components.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: 'assets/images/bookLover.png',
        title: 'Who does not read does not see life well ',
        body:
            'You can go around the world without leaving your home , you can own a time machine and travel to all times even though there is no such a mythic machine'),
    OnBoardingModel(
        image: 'assets/images/speedTest.png',
        title: 'Gain the greatest amount of knowledge in a short time,',
        body:
            'Anyone can learn the skill of fast reading, as the average reading speed is just a habit that a person acquires with practice and time.'),
    OnBoardingModel(
        image: 'assets/images/followUp.png',
        title: 'Follow your readings ',
        body:
            'Enhance your knowledge to become better and smarter. Take your important life to a new level by being open to the knowledge contained in books'),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateToAndBurn(context, const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: firstColor,
        actions: [
          TextButton(
            onPressed: submit,
            child: const Text(
              'SKIP',
              style: TextStyle(
                fontSize: 16,
                color: fifthColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [firstColor, secondColor, thirdColor],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      BoardingItem(boarding[index], context),
                  itemCount: boarding.length,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: secondColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                    count: boarding.length,
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
