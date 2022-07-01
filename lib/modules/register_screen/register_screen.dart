import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/HomeScreen/cubit/layout_cubit.dart';
import 'package:graduation_project/modules/home_layout/cubit/home_cubit.dart';

import 'package:graduation_project/modules/home_layout/home_layout.dart';
import 'package:graduation_project/modules/register_screen/cubit/register_cubit.dart';
import 'package:graduation_project/modules/register_screen/cubit/register_states.dart';
import 'package:graduation_project/widgets/fade_animation.dart';

import '../../network/local_network/Cache_Helper.dart';
import '../../widgets/reusable_components.dart';
import '../ProfileScreen/ProfileCubit/profile_cubit.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // ignore: non_constant_identifier_names
  final password_confirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              if (state.registerModel.message == 'Successful register') {
                // ignore: avoid_print
                print(state.registerModel.message);
                // ignore: avoid_print
                print(state.registerModel.token);
                ProfileCubit.get(context).getUserProfile();

                showToast(
                    text: state.registerModel.message!,
                    state: ToastStates.SUCCESS);

                CacheHelper.saveData(key: 'token', value: true).then(
                  (value) => navigateToAndBurn(
                    context,
                    HomeLayout(),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [firstColor, secondColor, thirdColor],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeAnimation(
                            1,
                            Container(
                              height: 200,
                              width: 170,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/light.png'),
                                    fit: BoxFit.fill),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: FadeAnimation(
                            1.6,
                            Row(
                              children: [
                                Container(
                                  child: Text('Sign Up ',
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
                                    defaultFormField(
                                        style: LayoutCubit.get(context).isDark
                                            ? Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: fifthColor)
                                            : Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                        context: context,
                                        controller: nameController,
                                        inputType: TextInputType.name,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Name must not be null';
                                          }
                                        },
                                        label: 'Full Name',
                                        prefixIcon: Icons.person),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    defaultFormField(
                                        style: LayoutCubit.get(context).isDark
                                            ? Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: fifthColor)
                                            : Theme.of(context)
                                                .textTheme
                                                .subtitle2,
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
                                        label: 'Email Adress',
                                        prefixIcon: Icons.email),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    defaultFormField(
                                      style: LayoutCubit.get(context).isDark
                                          ? Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: fifthColor)
                                          : Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                      context: context,
                                      controller: passwordController,
                                      inputType: TextInputType.visiblePassword,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password must not be null';
                                        }
                                        if (value.length <= 7) {
                                          return 'Password should be at least 8 charachters';
                                        }
                                      },
                                      label: 'Password',
                                      prefixIcon: Icons.lock,
                                      suffixIcon: RegisterCubit.get(context)
                                          .passwordIcon,
                                      isPasswordShown:
                                          RegisterCubit.get(context)
                                              .isPasswordShown,
                                      onTapSuffixIcon: () =>
                                          RegisterCubit.get(context)
                                              .showPassword(),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    defaultFormField(
                                      style: LayoutCubit.get(context).isDark
                                          ? Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: fifthColor)
                                          : Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                      context: context,
                                      controller:
                                          password_confirmationController,
                                      inputType: TextInputType.visiblePassword,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password must not be null';
                                        }
                                        if (value.length <= 7) {
                                          return 'Password should be at least 8 charachters';
                                        }
                                      },
                                      label: 'Confirm Password',
                                      prefixIcon: Icons.lock,
                                      suffixIcon: RegisterCubit.get(context)
                                          .passwordIcon,
                                      isPasswordShown:
                                          RegisterCubit.get(context)
                                              .isPasswordShown,
                                      onTapSuffixIcon: () =>
                                          RegisterCubit.get(context)
                                              .showPassword(),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    FadeAnimation(
                                      2,
                                      Container(
                                        child: ConditionalBuilder(
                                            condition:
                                                state is! RegisterLoadingState,
                                            builder: (context) => Container(
                                                  child: defaultButton(
                                                    context: context,
                                                    function: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        RegisterCubit.get(context).userRegister(
                                                            name: nameController
                                                                .text,
                                                            email:
                                                                emailController
                                                                    .text,
                                                            password:
                                                                passwordController
                                                                    .text,
                                                            password_confirmation:
                                                                password_confirmationController
                                                                    .text);
                                                      }
                                                    },
                                                    text: 'Sign Up',
                                                  ),
                                                ),
                                            fallback: (ctx) => const Center(
                                                  child: Image(
                                                    image: AssetImage(
                                                        'assets/images/loading.gif'),
                                                    height: 90,
                                                    width: 90,
                                                  ),
                                                )),
                                      ),
                                    )
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
        ));
  }
}
