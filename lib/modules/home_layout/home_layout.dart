import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/profile_cubit.dart';

import 'package:graduation_project/modules/search_screen/search_screen.dart';

import '../../widgets/reusable_components.dart';
import '../FastReadingSection/fast_rading_introduction.dart';
import '../HomeScreen/home_screen.dart';
import '../ProfileScreen/profile_screen.dart';

class HomeLayout extends StatefulWidget {
  //const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(
        Icons.run_circle_sharp,
        size: 30,
      ),
      const Icon(
        Icons.book,
        size: 30,
      ),
      const Icon(
        Icons.search,
        size: 30,
      ),
      const Icon(
        Icons.person_pin_circle,
        size: 30,
      ),
    ];

    return Scaffold(
        extendBody: true,
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              const HomeScreen(),
              const FastReadingIntroductionScreen(),
              const Center(
                child: Text(
                  'No Books added yet',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SearchScreen(),
              //AudioPlayerBackgroundPlaylist(),
              ProfileScreen()
            ],
            onPageChanged: (int index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            }),
        // ),
        bottomNavigationBar: Theme(
          data: ThemeData(iconTheme: const IconThemeData(color: fifthColor)),
          child: CurvedNavigationBar(
              color: const Color.fromARGB(240, 220, 252, 231),
              buttonBackgroundColor: thirdColor,
              //animationCurve: Curves.easeInOutBack,
              animationDuration: const Duration(milliseconds: 350),
              backgroundColor: Colors.transparent,
              items: items,
              height: 65,
              index: 0,
              onTap: (int index) => setState(() {
                if(index==5)ProfileCubit .get(context).getUserProfile();
                    _pageController.jumpToPage(index);
                  })),
        ));
  }
}
