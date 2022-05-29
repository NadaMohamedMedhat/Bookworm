import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/modules/home_layout/cubit/home_cubit.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';
import 'package:graduation_project/modules/BooksScreen/youtube_screen.dart';

import '../../widgets/reusable_components.dart';
import '../PDFs/pdf_screen.dart';

class BookDetailsScreen extends StatelessWidget {
  static const routePass = 'bookDetailsScreen';

  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookId = ModalRoute.of(context)!.settings.arguments as int;
    var model = HomeCubit.get(context).homeModel!.data;
    final selecteBook = model!.firstWhere((element) => element.id == bookId);
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (
          context,
          state,
        ) {
          return Scaffold(
            //backgroundColor: sixthColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(34),
                              topRight: Radius.circular(34)),
                          color: fourthColor),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 230, left: 230, top: 10),
                            child: Container(
                              width: double.infinity,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
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
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ),
                                DataColumn(
                                  label: Text('Category',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ),
                                DataColumn(
                                  label: Text('Rate',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text(
                                    selecteBook.author!,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  )),
                                  DataCell(Text(
                                    selecteBook.categories.toString(),
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  )),
                                  DataCell(
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2);
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
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
                                        //color: secondColor,
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              thirdColor,
                                              firstColor,
                                            ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
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
                                                builder:
                                                    (BuildContext context) {
                                                  return Stack(children: [
                                                    YoutubePlayer(
                                                      selecteBook.audio
                                                          .toString(),
                                                          
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

Widget YoutubePlayer(selectedVedio ) {
  return Dialog(
    elevation: 15,
    backgroundColor: thirdColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)), //this right here
    child: Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircleAvatar(
            //     radius: 20,
            //     backgroundColor: fourthColor,
            //     child: IconButton(
            //       onPressed: () {
            //        // Navigator.pop();
            //       },
            //       icon: const Icon(Icons.close),
            //       color: Colors.red,
            //     )),
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


Widget EmptyAudio(context) {
  return Dialog(
    elevation: 15,
    backgroundColor: thirdColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)), //this right here
    child: Container(
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
