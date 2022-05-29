import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<ProfileCubit, ProfileStates>(
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
          body: ListView(
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
                    color: secondColor,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          LayoutCubit.get(context).changeAppMode();
                        },
                        icon: const Icon(Icons.dark_mode)),
                  ),
                  Positioned(
                    top: 125.0,
                    left: 15.0,
                    right: 15.0,
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(7.0),
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75.0,
                    left: (MediaQuery.of(context).size.width / 2 - 50.0),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/person.webp'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    top: 190.0,
                    left: (MediaQuery.of(context).size.width / 2) - 105.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            // FlatButton(
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(7.0),
                            //   ),
                            //   color: secondColor,
                            //   onPressed: () {},
                            //   child: const Text(
                            //     'Edit Profile',
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 15.0,
                            //         color: Colors.white),
                            //   ),
                            // ),
                            const SizedBox(width: 5.0),
                            // FlatButton(
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(7.0),
                            //   ),
                            //   color: Colors.grey,
                            //   onPressed: () {
                            //     CacheHelper.removeData(
                            //       key: 'token',
                            //     ).then((value) {
                            //       // if (value) {
                            //       //   CacheHelper.removeData(key: 'myToken')
                            //       //       .then((value) {});
                            //         navigateToAndBurn(
                            //           context,
                            //           const LoginScreen(),
                            //         );
                            //       }
                            //    // }
                            //     );
                            //   },
                            //   child: const Text(
                            //     'Logout',
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 15.0,
                            //         color: Colors.white),
                            //   ),
                            // )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      defaultFormField(
                          controller: nameController,
                          filledColor: const Color.fromARGB(253, 220, 252, 231),
                          context: context,
                          inputType: TextInputType.name,
                          label: 'User Name',
                          prefixIcon: Icons.person),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: emailController,
                          filledColor: const Color.fromARGB(253, 220, 252, 231),
                          context: context,
                          inputType: TextInputType.emailAddress,
                          label: 'User Email',
                          prefixIcon: Icons.email)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
        // ConditionalBuilder(
        //   condition: ProfileCubit.get(context).userProfile != null,
        //   builder: (context) => Scaffold(
        //     body: ListView(
        //       children: <Widget>[
        //         Stack(
        //           children: <Widget>[
        //             Container(
        //               height: 350.0,
        //               width: double.infinity,
        //             ),
        //             Container(
        //               height: 200.0,
        //               width: double.infinity,
        //               color: secondColor,
        //             ),
        //             Align(
        //               alignment: Alignment.topLeft,
        //               child: IconButton(
        //                 icon: const Icon(Icons.arrow_back_ios),
        //                 onPressed: () {
        //                   Navigator.pop(context);
        //                 },
        //                 color: Colors.white,
        //               ),
        //             ),
        //             Align(
        //               alignment: Alignment.topRight,
        //               child: IconButton(
        //                   onPressed: () {
        //                     LayoutCubit.get(context).changeAppMode();
        //                   },
        //                   icon: const Icon(Icons.dark_mode)),
        //             ),
        //             Positioned(
        //               top: 125.0,
        //               left: 15.0,
        //               right: 15.0,
        //               child: Material(
        //                 elevation: 3.0,
        //                 borderRadius: BorderRadius.circular(7.0),
        //                 child: Container(
        //                   height: 200.0,
        //                   decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(7.0),
        //                       color: Colors.white),
        //                 ),
        //               ),
        //             ),
        //             Positioned(
        //               top: 75.0,
        //               left: (MediaQuery.of(context).size.width / 2 - 50.0),
        //               child: Container(
        //                 height: 100.0,
        //                 width: 100.0,
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(50.0),
        //                     image: const DecorationImage(
        //                         image:
        //                             AssetImage('assets/images/person.webp'),
        //                         fit: BoxFit.cover)),
        //               ),
        //             ),
        //             Positioned(
        //               top: 190.0,
        //               left: (MediaQuery.of(context).size.width / 2) - 105.0,
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Row(
        //                     children: <Widget>[
        //                       FlatButton(
        //                         shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(7.0),
        //                         ),
        //                         color: secondColor,
        //                         onPressed: () {},
        //                         child: const Text(
        //                           'Edit Profile',
        //                           style: TextStyle(
        //                               fontWeight: FontWeight.bold,
        //                               fontSize: 15.0,
        //                               color: Colors.white),
        //                         ),
        //                       ),
        //                       const SizedBox(width: 5.0),
        //                       FlatButton(
        //                         shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(7.0),
        //                         ),
        //                         color: Colors.grey,
        //                         onPressed: () {
        //                           CacheHelper.removeData(
        //                             key: 'token',
        //                           ).then((value) {
        //                             if (value) {
        //                               CacheHelper.removeData(key: 'myToken').then((value) {});
        //                               navigateToAndBurn(
        //                                 context,
        //                                 const LoginScreen(),);
        //                             }
        //                           });
        //                         },
        //                         child: const Text(
        //                           'Logout',
        //                           style: TextStyle(
        //                               fontWeight: FontWeight.bold,
        //                               fontSize: 15.0,
        //                               color: Colors.white),
        //                         ),
        //                       )
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //         const SizedBox(height: 10.0),
        //         Padding(
        //           padding: const EdgeInsets.all(14.0),
        //           child: Form(
        //             key: formKey,
        //             child: Column(
        //               children: <Widget>[
        //                 defaultFormField(
        //                     controller: nameController,
        //                     filledColor: const Color.fromARGB(253, 220, 252, 231),
        //                     context: context,
        //                     inputType: TextInputType.name,
        //                     label: 'User Name',
        //                     prefixIcon: Icons.person),
        //                 const SizedBox(
        //                   height: 15,
        //                 ),
        //                 defaultFormField(
        //                     controller: emailController,
        //                     filledColor: const Color.fromARGB(253, 220, 252, 231),
        //                     context: context,
        //                     inputType: TextInputType.emailAddress,
        //                     label: 'User Email',
        //                     prefixIcon: Icons.email)
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}
