import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/forget_password/cubit/forget_password_states.dart';
import 'package:graduation_project/widgets/reusable_components.dart';

import '../../widgets/fade_animation.dart';
import 'cubit/forget_password_cubit.dart';


class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccessState) {
            if (state.forgetpasswordModel.status ==
                "We have emailed your password reset link!") {
              showToast(
                  text: state.forgetpasswordModel.status!,
                  state: ToastStates.SUCCESS);
            }
            ;
          }
          ;
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [firstColor, secondColor, thirdColor],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      FadeAnimation(
                        1,
                        Container(
                          height: 200,
                          width: 170,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/forgotpassword.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: FadeAnimation(
                          1.6,
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Text('Forgot Password',
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FadeAnimation(
                        1.8,
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: fourthColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      'No Worries, We will send to you reset instructions.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  defaultFormField(
                                      context: context,
                                      controller: emailController,
                                      inputType: TextInputType.emailAddress,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email must not be null';
                                        }
                                        if (!value.endsWith('.com')) {
                                          return 'Invalid Email Address';
                                        }
                                      },
                                      label: 'Email Address',
                                      prefixIcon: Icons.email),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  FadeAnimation(
                                    2,
                                    Container(
                                      child: ConditionalBuilder(
                                        condition: state
                                            is! ForgetPasswordLoadingState,
                                        builder: (context) => Container(
                                          child: defaultButton(
                                              function: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  ForgetPasswordCubit.get(
                                                          context)
                                                      .userForgetpassword(
                                                    email: emailController.text,
                                                  );
                                                };
                                              },
                                              text: 'Reset ',
                                              context: context),
                                        ),
                                        fallback: (ctx) => const Center(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/loading.gif'),
                                            height: 90,
                                            width: 90,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}