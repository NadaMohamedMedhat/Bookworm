import 'package:flutter/material.dart';
import 'package:graduation_project/modules/BooksScreen/book_details_screen.dart';
import 'package:graduation_project/modules/BooksScreen/book_screen.dart';

class ScientificBooks extends StatefulWidget {
  const ScientificBooks({Key? key}) : super(key: key);

  @override
  State<ScientificBooks> createState() => _ScientificBooksState();
}

class _ScientificBooksState extends State<ScientificBooks> {
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
      body: Stack(
        children: <Widget>[
          _mainContent(context),
        ],
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
              "Scientific Books",
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
                title: 'Computer Science',
                itemsNumber: 9,
                listNumber: 14,
                screenNav: BookDetailsScreen.routePass,
              ),
              BooksScreen(
                  title: 'chemistry ',
                  itemsNumber: 4,
                  listNumber: 33,
                  screenNav: BookDetailsScreen.routePass),
              BooksScreen(
                title: 'physics ',
                itemsNumber: 3,
                listNumber: 41,
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
            if (currentPage == 1) {
              togglePrev();
            } else if (currentPage == 2) {
              toogleDoublePrev();
            }
          },
          buttonText: "CS ",
          color: currentPage < 1 ? Theme.of(context).accentColor : Colors.white,
          textColor:
              currentPage < 1 ? Colors.white : Theme.of(context).accentColor,
          borderColor: currentPage < 1
              ? Colors.transparent
              : Theme.of(context).accentColor,
        )),
        const SizedBox(
          width: 25,
        ),
        Expanded(
            child: CustomButton(
          onPressed: () {
            if (currentPage == 0) {
              toggleNext();
            } else if (currentPage == 2) {
              togglePrev();
            }
          },
          buttonText: "chemistry ",
          color:
              currentPage == 1 ? Theme.of(context).accentColor : Colors.white,
          textColor:
              currentPage == 1 ? Colors.white : Theme.of(context).accentColor,
          borderColor: currentPage == 1
              ? Colors.transparent
              : Theme.of(context).accentColor,
        )),
        const SizedBox(
          width: 25,
        ),
        Expanded(
            child: CustomButton(
          onPressed: () {
            if (currentPage == 1) {
              toggleNext();
            } else if (currentPage == 0) {
              toogleDoubleNext();
            }
            isSelected = !isSelected;
          },
          buttonText: "Physics ",
          color: currentPage > 1 ? Theme.of(context).accentColor : Colors.white,
          textColor:
              currentPage > 1 ? Colors.white : Theme.of(context).accentColor,
          borderColor: currentPage > 1
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

  toogleDoublePrev() {
    _pageController.jumpToPage(0);
  }

  toogleDoubleNext() {
    _pageController.jumpToPage(2);
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? color;
  final Color? textColor;
  final Color borderColor;

  CustomButton(
      {required this.onPressed,
      required this.buttonText,
      this.color,
      this.textColor,
      this.borderColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(height: 55  ,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(12)),
      color: color,
      textColor: textColor,
      padding: const EdgeInsets.all(14.0),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
