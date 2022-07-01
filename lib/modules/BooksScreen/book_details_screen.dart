import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/wantToReadModel.dart';
import 'package:graduation_project/modules/BooksScreen/scientific_screen.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/Profile_states.dart';
import 'package:graduation_project/modules/ProfileScreen/ProfileCubit/profile_cubit.dart';

import 'package:graduation_project/modules/home_layout/cubit/home_cubit.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';
import 'package:graduation_project/modules/BooksScreen/youtube_screen.dart';
import 'package:graduation_project/modules/want_to_read_screen/cubit/want_to_read_cubit.dart';
import 'package:graduation_project/modules/want_to_read_screen/cubit/want_to_read_states.dart';

import '../../widgets/reusable_components.dart';
import '../PDFs/pdf_screen.dart';

class BookDetailsScreen extends StatefulWidget {
  static const routePass = 'bookDetailsScreen';

  BookDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  String selectedValue = "Current Reading";

  bool _isDisable = true;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Want to Read"), value: "Want to Read"),
      //DropdownMenuItem(child: Text("Want to Read"), value: "Want to Read"),
      DropdownMenuItem(
          child: Text("Current Reading"), value: "Current Reading"),
      DropdownMenuItem(child: Text("Read"), value: "Read"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    bool isIn = false;
    final bookId = ModalRoute.of(context)!.settings.arguments as int;
    var model = HomeCubit.get(context).homeModel!.data;
    final selecteBook = model!.firstWhere((element) => element.id == bookId);
    Data data;

    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      // if (HomeCubit.get(context).postwantToReadModel!.status == true) {
      //   HomeCubit.get(context).addToWantToReadSection(
      //       ProfileCubit.get(context).id.toString(),
      //       selecteBook.id.toString(),
      //       '1');
      // } else {
      //   print('Already  exiiiiiists');
      // }
    }, builder: (
      context,
      state,
    ) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).backgroundColor),
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Hero(
                    tag: selecteBook.id!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11.0),
                      child: Image(
                        image: NetworkImage(selecteBook.url1!),
                        fit: BoxFit.cover,
                        width: 250,
                        height: 320,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 230, left: 230, top: 10),
                        child: Container(
                          width: double.infinity,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      BlocConsumer<GetWantToReadBooksCubit,
                          GetWantToReadBooksStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return BlocConsumer<ProfileCubit, ProfileStates>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              onSurface: secondColor),
                                          onPressed: _isDisable
                                              ? () {
                                                  HomeCubit.get(context)
                                                      .addToWantToReadSection(
                                                          ProfileCubit.get(
                                                                  context)
                                                              .id
                                                              .toString(),
                                                          selecteBook.id
                                                              .toString(),
                                                          '1');
                                                  setState(() {
                                                    _isDisable = false;
                                                  });
                                                }
                                              : () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: const Text(
                                                            'Book Already added',
                                                          ),
                                                          action:
                                                              SnackBarAction(
                                                                  label: 'Undo',
                                                                  onPressed:
                                                                      () {
                                                                    //
                                                                  }),
                                                          duration:
                                                              const Duration(
                                                                  seconds: 3),
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 30,
                                                                  left: 10,
                                                                  right: 10)));
                                                },
                                          child: const Text("Want to Read")),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              onSurface: secondColor),
                                          onPressed: _isDisable
                                              ? () {
                                                  HomeCubit.get(context)
                                                      .addToWantToReadSection(
                                                          ProfileCubit.get(
                                                                  context)
                                                              .id
                                                              .toString(),
                                                          selecteBook.id
                                                              .toString(),
                                                          '2');
                                                  setState(() {
                                                    _isDisable = false;
                                                  });
                                                }
                                              : () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: const Text(
                                                            'Book Already added',
                                                          ),
                                                          action:
                                                              SnackBarAction(
                                                                  label: 'Undo',
                                                                  onPressed:
                                                                      () {
                                                                    //
                                                                  }),
                                                          duration:
                                                              const Duration(
                                                                  seconds: 3),
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 30,
                                                                  left: 10,
                                                                  right: 10)));
                                                },
                                          child: const Text("Current Reading")),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              onSurface: secondColor),
                                          onPressed: _isDisable
                                              ? () {
                                                  HomeCubit.get(context)
                                                      .addToWantToReadSection(
                                                          ProfileCubit.get(
                                                                  context)
                                                              .id
                                                              .toString(),
                                                          selecteBook.id
                                                              .toString(),
                                                          '3');
                                                  setState(() {
                                                    _isDisable = false;
                                                  });
                                                }
                                              : () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: const Text(
                                                            'Book Already added',
                                                          ),
                                                          action:
                                                              SnackBarAction(
                                                                  label: 'Undo',
                                                                  onPressed:
                                                                      () {
                                                                    //
                                                                  }),
                                                          duration:
                                                              const Duration(
                                                                  seconds: 3),
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 30,
                                                                  left: 10,
                                                                  right: 10)));
                                                },
                                          child: const Text("Read")),
                                    ),
                                    //delete(1)
                                  ],
                                );
                                //  DropdownButtonHideUnderline(
                                //   child: DropdownButton(
                                //       iconSize: 25,
                                //       hint: Row(
                                //         children: [
                                //           Icon(Icons.check_circle),
                                //           Text('Add Book to'),
                                //         ],
                                //       ),
                                //       elevation: 16,
                                //       items: dropdownItems,
                                //       //value: selectedValue,
                                //       onChanged: (String? newValue) {
                                //         setState(() {
                                //           selectedValue = newValue!;
                                //           _isDisable = true;
                                //         });
                                //         if (selectedValue == 'Want to Read') {
                                //           HomeCubit.get(context)
                                //               .addToWantToReadSection(
                                //                   ProfileCubit.get(context)
                                //                       .id
                                //                       .toString(),
                                //                   selecteBook.id.toString(),
                                //                   '1');
                                //           print('Book Added to Want to Read');
                                //         } else if (selectedValue ==
                                //             'Current Reading') {
                                //           HomeCubit.get(context)
                                //               .addToWantToReadSection(
                                //                   ProfileCubit.get(context)
                                //                       .id
                                //                       .toString(),
                                //                   selecteBook.id.toString(),
                                //                   '2');
                                //           print(
                                //               'Book Added to Current Reading');
                                //         } else if (selectedValue == 'Read') {
                                //           HomeCubit.get(context)
                                //               .addToWantToReadSection(
                                //                   ProfileCubit.get(context)
                                //                       .id
                                //                       .toString(),
                                //                   selecteBook.id.toString(),
                                //                   '3');
                                //           print('Book Added to Read');
                                //         }else if(!_isDisable){
                                //           null;
                                //         }
                                //       }),
                                // );
                                //ProfileCubit.get(context).id.toString(),
                                //       selecteBook.id.toString(),
                                //       '1'
                                //       .addToWantToReadSection(
                                //           ProfileCubit.get(context).id,
                                //           int.parse(
                                //             selecteBook.id.toString(),
                                //           ),
                                //           1);,);
                                // Row(
                                //   children: [
                                //   CustomButton(
                                // onPressed: () {
                                //   //  List my =
                                //   //HomeCubit.get(context).homeModel!.status
                                //   // != 'success'?

                                //   // GetWantToReadBooksCubit.get(context)
                                //   //     .wantToReadModel!
                                //   //     .data!.forEach((element) {
                                //   //       element.id = selecteBook.id;
                                //   //     });
                                //   // bool bookExists =
                                //   // HomeCubit.get(context)
                                //   //     .postwantToReadModel!.data!.bookId == selecteBook.id;
                                //   //  .data!
                                //   // .any((element) =>
                                //   //     // ignore: unrelated_type_equality_checks
                                //   //     element.bookId == selecteBook.id);

                                //   // if ( HomeCubit.get(context)
                                //   //         .postwantToReadModel!.data!.id.toString() == selecteBook.id.toString()) {
                                //   //   print('Book Already exists');
                                //   // } else {
                                //   //   HomeCubit.get(context)
                                //   //       .addToWantToReadSection(
                                //   //           ProfileCubit.get(context).id,
                                //   //           int.parse(
                                //   //             selecteBook.id.toString(),
                                //   //           ),
                                //   //           1);
                                //   // }
                                //   //: print('Already  exiiiiiists');
                                //   // HomeCubit.get(context).postwantToReadModel!.status == true ?
                                //   // print('Already  exiiiiiists'):
                                //   // ignore: unrelated_type_equality_checks
                                //   // if (HomeCubit.get(context)
                                //   //         .postwantToReadModel!
                                //   //         .status ==
                                //   //     true) {
                                //   //   HomeCubit.get(context)
                                //   //       .addToWantToReadSection(
                                //   //           ProfileCubit.get(context)
                                //   //               .id
                                //   //               .toString(),
                                //   //           selecteBook.id.toString(),
                                //   //           '1');
                                //   // } else {
                                //   //   print('Already  exiiiiiists');
                                //   // GetWantToReadBooksCubit.get(context)
                                //   //             .wantToReadModel!
                                //   //             .data![0]
                                //   //             .bookId ==
                                //   //         HomeCubit.get(context).data!.data![0].id
                                //   //     ? HomeCubit.get(context)
                                //   //         .addToWantToReadSection(
                                //   //             ProfileCubit.get(context)
                                //   //                 .id
                                //   //                 .toString(),
                                //   //             selecteBook.id.toString(),
                                //   //             '1')
                                //   //     : GetWantToReadBooksCubit.get(context)
                                //   //                 .wantToReadModel!
                                //   //                 .data![0]
                                //   //                 .bookId ==
                                //   //             selecteBook.id
                                //   //         ? HomeCubit.get(context)
                                //   //             .addToWantToReadSection(
                                //   //                 ProfileCubit.get(context)
                                //   //                     .id
                                //   //                     .toString(),
                                //   //                 selecteBook.id.toString(),
                                //   //                 '1')
                                //   //         : print('Already  exiiiiiists');
                                //   HomeCubit.get(context).addToWantToReadSection(
                                //       ProfileCubit.get(context).id.toString(),
                                //       selecteBook.id.toString(),
                                //       '1');
                                // }
                              }
                              // buttonText: "Want to Read ",
                              // color: isIn
                              //     ? Theme.of(context).accentColor
                              //     : Colors.white,
                              // textColor: isIn
                              //     ? Colors.white
                              //     : Theme.of(context).accentColor,
                              // borderColor: isIn
                              //     ? Colors.transparent
                              //     : Theme.of(context).accentColor,
                              );
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          //     Expanded(
                          //       child: CustomButton(
                          //         onPressed: () {
                          //           //HomeCubit.get(context).homeModel!.status != 'success'?
                          //           HomeCubit.get(context)
                          //               .addToWantToReadSection(
                          //                   ProfileCubit.get(context).id,
                          //                   int.parse(
                          //                     selecteBook.id.toString(),
                          //                   ),
                          //                   2);
                          //           // : print('Already  exiiiiiists');
                          //         },
                          //         buttonText: "Want to Read ",
                          //         color: isIn
                          //             ? Theme.of(context).accentColor
                          //             : Colors.white,
                          //         textColor: isIn
                          //             ? Colors.white
                          //             : Theme.of(context).accentColor,
                          //         borderColor: isIn
                          //             ? Colors.transparent
                          //             : Theme.of(context).accentColor,
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       width: 20,
                          //     ),
                          //     Expanded(
                          //       child: CustomButton(
                          //         onPressed: () {
                          //           //HomeCubit.get(context).homeModel!.status != 'success'?
                          //           HomeCubit.get(context)
                          //               .addToWantToReadSection(
                          //                   ProfileCubit.get(context).id,
                          //                   int.parse(
                          //                     selecteBook.id.toString(),
                          //                   ),
                          //                   3);
                          //           // : print('Already  exiiiiiists');
                          //         },
                          //         buttonText: "Want to Read ",
                          //         color: isIn
                          //             ? Theme.of(context).accentColor
                          //             : Colors.white,
                          //         textColor: isIn
                          //             ? Colors.white
                          //             : Theme.of(context).accentColor,
                          //         borderColor: isIn
                          //             ? Colors.transparent
                          //             : Theme.of(context).accentColor,
                          //       ),
                          //     ),
                          //   ],
                          // );
                          //},
                          //);
                        },
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Text(
                        'More Details',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(selecteBook.name.toString(),
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                  'Published by : ${selecteBook.publishedBy.toString()}',
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                  'Year : ${selecteBook.year.toString()}',
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DataTable(
                          dataRowHeight: 100,
                          columnSpacing: 20,
                          dividerThickness: 5,
                          columns: [
                            DataColumn(
                              label: Text('Author',
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                            DataColumn(
                              label: Text('Category',
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                            DataColumn(
                              label: Text('Rate',
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text(
                                selecteBook.author!,
                                style: Theme.of(context).textTheme.subtitle2,
                              )),
                              DataCell(Text(
                                selecteBook.categories.toString(),
                                style: Theme.of(context).textTheme.subtitle2,
                              )),
                              DataCell(
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.black54),
                                  width: 100,
                                  height: 50,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        selecteBook.rate.toString(),
                                        style: const TextStyle(
                                            color: Colors.yellow),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ])
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Quick Overview',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Builder(
                            builder: (context) {
                              return Text(selecteBook.description!,
                                  style: Theme.of(context).textTheme.subtitle2);
                            },
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                width: 160,
                                decoration: const BoxDecoration(
                                    //color: secondColor,
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          thirdColor,
                                          firstColor,
                                        ]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: TextButton(
                                  onPressed: () {
                                    //navigateTo(context, PDFScreen());
                                    //readOnClick(context , id);
                                    Navigator.pushNamed(
                                        context, PDFScreen.routePass,
                                        arguments: selecteBook.id);
                                  },
                                  child: const Text('Read',
                                      //'READ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: fourthColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),

                          // ReadOrListenButton(
                          //     context,
                          //     'Read Now',
                          //     readOnClick(context, selecteBook.id , PDFScreen.routePass)),
                          const Spacer(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                width: 160,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          thirdColor,
                                          firstColor,
                                        ]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: TextButton(
                                  onPressed: () {
                                    selecteBook.audio == ""
                                        ? showDialog(
                                            context: context,
                                            builder: (context) {
                                              return EmptyAudio(context);
                                            })
                                        : showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Stack(children: [
                                                YoutubePlayer(
                                                  selecteBook.audio.toString(),
                                                ),
                                              ]);
                                            });
                                    //navigateTo(context, PDFScreen());
                                    //readOnClick(context , id);

                                    //selecteBook.id
                                  },
                                  child: const Text('Listen',
                                      //'READ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: fourthColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// ignore: non_constant_identifier_names
Widget YoutubePlayer(selectedVedio) {
  return Dialog(
    elevation: 15,
    backgroundColor: thirdColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)), //this right here
    child: SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            YoutubePlayerWidget(videoUrl: selectedVedio),
          ],
        ),
      ),
    ),
  );
}

Widget delete(Carts model) {
  return BlocConsumer<HomeCubit, HomeStates>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return BlocConsumer<GetWantToReadBooksCubit, GetWantToReadBooksStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialButton(
            onPressed: () {
              GetWantToReadBooksCubit.get(context)
                  .wantToReadModel!
                  .data!
                  .removeWhere((element) => element.carts!.id == model.id);
              HomeCubit.get(context).deleteBook(model.id!);
            },
            child: Text('Delete'),
          );
        },
      );
    },
  );
}

// ignore: non_constant_identifier_names
Widget EmptyAudio(context) {
  return Dialog(
    elevation: 15,
    backgroundColor: thirdColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)), //this right here
    child: SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 20,
                backgroundColor: fourthColor,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  color: Colors.red,
                )),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Will be available soon',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: fourthColor),
            )
          ],
        ),
      ),
    ),
  );
}

// Widget ReadOrListenButton(context, String txt, Function toDo) {
//   return
// }

// readOnClick(context, id , route) {
//   Navigator.pushNamed(context, route, arguments: id
//       //selecteBook.id
//       );
// }

// listenOnClick(context, selecteBook) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Stack(
//           children: [
//             Positioned(
//               top: 60,
//               left: 40,
//               right: 40,
//               child: CircleAvatar(
//                   // backgroundColor: Colors.transparent,
//                   radius: 80,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(15)),
//                     child: Image(image: NetworkImage(selecteBook.url1!)),
//                   )),
//             ),
//             YoutubePlayer(
//               selecteBook.audio.toString(),
//             )
//           ],
//         );
//       });
// }

class DropDownButton extends StatefulWidget {
  final Function fun1;

  const DropDownButton({Key? key, required this.fun1}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  late Function fun1;
  String selectedValue = "Current Reading";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Want to Read"), value: "Want to Read"),
      //DropdownMenuItem(child: Text("Want to Read"), value: "Want to Read"),
      DropdownMenuItem(
          child: Text("Current Reading"), value: "Current Reading"),
      DropdownMenuItem(child: Text("Read"), value: "Read"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          iconSize: 25,
          hint: Row(
            children: [
              Icon(Icons.check_circle),
              Text('Add Book to'),
            ],
          ),
          elevation: 16,
          items: dropdownItems,
          //value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
            if (selectedValue == 'Want to Read') {
              () => fun1;
              print('Want to Read');
            } else if (selectedValue == 'Current Reading') {
              print('Current Reading');
            } else if (selectedValue == 'Read') {
              print('Read');
            }
          }),
    );
  }
}
