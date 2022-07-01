import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/get_score_model.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_cubit.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';
import 'package:graduation_project/modules/user_scores_screen.dart';

import '../../network/local_network/Cache_Helper.dart';
import '../../widgets/reusable_components.dart';
import '../HomeScreen/cubit/layout_cubit.dart';
import '../Login_Screen/login_screen.dart';
import 'ProfileCubit/Profile_states.dart';
import 'ProfileCubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     nameController.text = userName!;
  //     emailController.text = userEmail!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getUserScore(ProfileCubit.get(context).id),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          //
          // var model = ProfileCubit.get(context).userProfile;
          if (ProfileCubit.get(context).name == null &&
              ProfileCubit.get(context).email == null) {
          } else {
            nameController.text = ProfileCubit.get(context).name!;
            emailController.text = ProfileCubit.get(context).email!;
          }

          //

          bool isDark = CacheHelper.getData(key: 'isDark');

          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 350.0,
                          width: double.infinity,
                        ),
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        Positioned(
                          top: 125.0,
                          left: 15.0,
                          right: 15.0,
                          child: Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(7.0),
                            child: Container(
                              child: Center(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                        child: Text(
                                      nameController.text,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )),
                                    Expanded(
                                        child: Text(
                                      emailController.text,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // TextButton(
                                    //     onPressed: () {
                                    //       navigateTo(context,
                                    //           const UserScoresScreen());
                                    //     },
                                    //     child: Row(
                                    //       children: const [
                                    //         Expanded(
                                    //             child:
                                    //                 Icon(Icons.track_changes)),
                                    //         Expanded(
                                    //             child:
                                    //                 Text('Track Your Score')),
                                    //         Expanded(
                                    //             child: Icon(Icons.arrow_right)),
                                    //       ],
                                    //     )
                                    //     ),
                                  ],
                                ),
                              ),
                              height: 200.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(7.0),
                                  border:
                                      Border.all(color: secondColor, width: 2)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    myScoreLevel(),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: MaterialButton(
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        color: secondColor,
                        onPressed: () {
                          CacheHelper.removeData(
                            key: 'token',
                          ).then((value) {
                            navigateToAndBurn(
                              context,
                              const LoginScreen(),
                            );
                          });
                        },
                        child: Center(
                          child: Row(
                            children: const [
                              Text(
                                'Logout',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.logout_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    //  myScoreLevel('2'),
                    //  myScoreLevel('3'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget myScoreLevel() {
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
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (
        context,
        state,
      ) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
                ],
              ),
            ],
          ),
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
//  testfehiuhi111@gmail.com