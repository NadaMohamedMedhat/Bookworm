// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/wantToReadModel.dart';
import 'package:graduation_project/modules/BooksScreen/book_details_screen.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/Profile_states.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/profile_cubit.dart';
import 'package:graduation_project/modules/want_to_read_screen/cubit/want_to_read_cubit.dart';
import 'package:graduation_project/modules/want_to_read_screen/cubit/want_to_read_states.dart';

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
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
            child: _button(context),
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            children: const <Widget>[
              WantToReadScreen(
                section: 1,
              ),
              WantToReadScreen(
                section: 2,
              ),
              WantToReadScreen(
                section: 3,
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
          buttonText: "Want to Read ",
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
          buttonText: "Current Reading ",
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
          buttonText: "Read ",
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
    return MaterialButton(
      height: 55,
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

class WantToReadScreen extends StatelessWidget {
  final int section;

  const WantToReadScreen({Key? key, required this.section}) : super(key: key);
  // SearchCubit? searchCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocProvider(
          create: (context) => GetWantToReadBooksCubit()
            ..getWantToReadBooks(ProfileCubit.get(context).id),
          child:
              BlocConsumer<GetWantToReadBooksCubit, GetWantToReadBooksStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return SafeArea(
                child: Scaffold(
                    body: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 22),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! GetWantToReadBooksLoadingState,
                          builder: (context) {
                            return GetWantToReadBooksCubit.get(context).wantToReadModel!.status == false ?Center(child: Text('No Books Added Yet',style: Theme.of(context).textTheme.subtitle1,),):
                                // GetWantToReadBooksCubit.get(context)
                                //             .wantToReadModel!
                                //             .message ==
                                //         'faild message'
                                //     ? Center(
                                //         child: Text(
                                //           'The Book isn\'t available',
                                //           style:
                                //               Theme.of(context).textTheme.subtitle1,
                                //         ),
                                //       )
                                //     :

                                Expanded(
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      GetWantToReadBooksCubit.get(context)
                                                  .wantToReadModel!
                                                  .data![index]
                                                  .section ==
                                              section
                                          ? wantToReadItemBuilder(
                                              GetWantToReadBooksCubit.get(
                                                      context)
                                                  .wantToReadModel!
                                                  .data![index]
                                                  .carts!,
                                              context)
                                          : Container(),
                                  separatorBuilder: (context, index) =>
                                      Container(),
                                  itemCount:
                                      GetWantToReadBooksCubit.get(context)
                                          .wantToReadModel!
                                          .data!
                                          .length),
                            );
                          },
                          fallback: (context) => const Center(
                            child: Image(
                              image: AssetImage('assets/images/loading.gif'),
                              height: 90,
                              width: 90,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              );
            },
          ),
        );
      },
    );
  }
  //create: (context) => SearchCubit()

  Widget wantToReadItemBuilder(Carts model, context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BookDetailsScreen.routePass,
            arguments: model.id);
      },
      child: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 7,
                shadowColor: Colors.grey[700],
                child: ClipRRect(
                  child: Image(
                    image: NetworkImage(
                      model.url1!,
                    ),
                    height: 230,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: Theme.of(context).textTheme.subtitle1,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(model.author!,
                          style: Theme.of(context).textTheme.subtitle2),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(model.categories!,
                          style: Theme.of(context).textTheme.subtitle2),
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black54),
                        width: 100,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                model.rate.toString(),
                                style: const TextStyle(color: Colors.yellow),
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
