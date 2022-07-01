import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_layout/cubit/home_cubit.dart';
import 'home_layout/cubit/home_states.dart';

class UserScoresScreen extends StatelessWidget {
  const UserScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
      children: [
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Column(
              children: <Widget>[
                BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: state is GetUserScoreSuccessState,
                        builder: (context) =>
                            //List.generate(1, (index) => (i , context)=> scor(model))

                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return scor(
                                  HomeCubit.get(context)
                                      .getUserScoreModel!
                                      .result![index],
                                );

                                //: Text('NOOOOOOOOO');
                              },
                              itemCount: 1,
                              // itemCount: HomeCubit.get(context)
                              //     .getUserScoreModel!
                              //     .result!
                              //     .length,
                            )
                        // Text(
                        //     HomeCubit.get(context)
                        //         .levelOne
                        //         .toString())
                        );
                    //:Text('2'));
                  },
                )
              ],
            ),
          ),
        ),
      ],
    ),
    );
  }

  Widget myScoreLevel(context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Column(
              children: <Widget>[
                BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: state is GetUserScoreSuccessState,
                        builder: (context) =>
                            //List.generate(1, (index) => (i , context)=> scor(model))

                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return scor(
                                  HomeCubit.get(context)
                                      .getUserScoreModel!
                                      .result![index],
                                );

                                //: Text('NOOOOOOOOO');
                              },
                              itemCount: 1,
                              // itemCount: HomeCubit.get(context)
                              //     .getUserScoreModel!
                              //     .result!
                              //     .length,
                            )
                        // Text(
                        //     HomeCubit.get(context)
                        //         .levelOne
                        //         .toString())
                        );
                    //:Text('2'));
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget scor(
    model,
  ) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (
        context,
        state,
      ) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Level',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                Expanded(
                  child: Text('Score',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                Expanded(
                  child: Text('Date',
                      style: Theme.of(context).textTheme.subtitle1),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Text(
                        HomeCubit.get(context)
                            .getUserScoreModel!
                            .result![index]
                            .level
                            .toString(),
                        //  result[index].level.toString(),
                        style: Theme.of(context).textTheme.subtitle1),
                    itemCount: HomeCubit.get(context)
                        .getUserScoreModel!
                        .result!
                        .length,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Text(
                        //  result[index].score.toString(),
                        HomeCubit.get(context)
                            .getUserScoreModel!
                            .result![index]
                            .score
                            .toString(),
                        style: Theme.of(context).textTheme.subtitle1),
                    itemCount: HomeCubit.get(context)
                        .getUserScoreModel!
                        .result!
                        .length,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Text(
                        HomeCubit.get(context)
                            .getUserScoreModel!
                            .result![index]
                            .createdAt
                            .toString(),
                        //                    result[index].createdAt.toString(),
                        style: Theme.of(context).textTheme.subtitle2),
                    itemCount: HomeCubit.get(context)
                        .getUserScoreModel!
                        .result!
                        .length,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
    // DataTable(
    //     dataRowHeight: 100,
    //     columnSpacing: 20,
    //     dividerThickness: 5,
    //     columns: [
    //       DataColumn(
    //         label: Text('Level', style: Theme.of(context).textTheme.subtitle1),
    //       ),
    //       DataColumn(
    //         label: Text('Score', style: Theme.of(context).textTheme.subtitle1),
    //       ),
    //       DataColumn(
    //         label: Text('Date', style: Theme.of(context).textTheme.subtitle1),
    //       ),
    //     ],
    //     rows: [
    //       DataRow(cells: [
    //         DataCell(
    //           Text(
    //           model.level.toString(),
    //           style: Theme.of(context).textTheme.subtitle2,
    //         )),
    //         DataCell(Text(
    //           model.score.toString(),
    //           style: Theme.of(context).textTheme.subtitle2,
    //         )),
    //         DataCell(Text(
    //           model.createdAt.toString(),
    //           style: Theme.of(context).textTheme.subtitle2,
    //         )),
    //       ])
    //     ]);
  }
}
