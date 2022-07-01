import 'package:flutter/material.dart';
import 'package:graduation_project/modules/BooksScreen/scientific_screen.dart';
import 'package:graduation_project/modules/BooksScreen/book_details_screen.dart';
import 'package:graduation_project/modules/BooksScreen/book_screen.dart';

class LiteratureBooks extends StatefulWidget {
  const LiteratureBooks({Key? key}) : super(key: key);

  @override
  State<LiteratureBooks> createState() => _LiteratureBooksState();
}

class _LiteratureBooksState extends State<LiteratureBooks> {
  final PageController _pageController = PageController();
  bool isSelected = true;
  double currentPage = 0;
  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
        //isSelected[1] = isSelected[2];
      });
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: Stack(
          children: <Widget>[
            _mainContent(context),
          ],
        ),
      ),
    );
  }

  Widget _mainContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 60),
           Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Literature Books",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: _button(context),
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            children: const <Widget>[
              BooksScreen(
                title: 'classic literature',
                itemsNumber: 5,
                listNumber: 9,
                screenNav: BookDetailsScreen.routePass,
              ),
              BooksScreen(
                title: 'modern literature ',
                itemsNumber: 4,
                listNumber: 37,
                screenNav: BookDetailsScreen.routePass,
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: CustomButton(
          onPressed: () {
            togglePrev();
          },
          buttonText: "Classic ",
          color:
              currentPage < 0.5 ? Theme.of(context).accentColor : Colors.white,
          textColor:
              currentPage < 0.5 ? Colors.white : Theme.of(context).accentColor,
          borderColor: currentPage < 0.5
              ? Colors.transparent
              : Theme.of(context).accentColor,
        )),
        const SizedBox(
          width: 32,
        ),
        Expanded(
            child: CustomButton(
          onPressed: () {
            toggleNext();
          },
          buttonText: "Modern ",
          color:
              currentPage > 0.5 ? Theme.of(context).accentColor : Colors.white,
          textColor:
              currentPage > 0.5 ? Colors.white : Theme.of(context).accentColor,
          borderColor: currentPage > 0.5
              ? Colors.transparent
              : Theme.of(context).accentColor,
        )),
      ],
    );
  }

  toggleNext() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }

  togglePrev() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }
}
