import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/want_to_read_screen/cubit/want_to_read_cubit.dart';
import 'package:graduation_project/network/local_network/Cache_Helper.dart';
import 'package:graduation_project/widgets/reusable_components.dart';
import 'modules/BooksScreen/book_details_screen.dart';
import 'modules/FastReadingSection/AnswerQuestionsCubit/cubit/post_score_cubit.dart';
import 'modules/FastReadingSection/FristLevel/cubit/paragraph_cubit.dart';
import 'modules/FastReadingSection/questions/questions_cubit.dart';
import 'modules/HomeScreen/cubit/layout_cubit.dart';
import 'modules/HomeScreen/cubit/layout_states.dart';
import 'modules/Login_Screen/cubit/login_cubit.dart';
import 'modules/Login_Screen/login_screen.dart';
import 'modules/PDFs/pdf_categories_screen.dart';
import 'modules/PDFs/pdf_development_screen.dart';
import 'modules/PDFs/pdf_literature_screen.dart';
import 'modules/PDFs/pdf_scientific_screen.dart';
import 'modules/PDFs/pdf_screen.dart';
import 'modules/ProfileScreen/ProfileCubit/profile_cubit.dart';
import 'modules/SplashScreen/splash_screen.dart';
import 'modules/home_layout/cubit/home_cubit.dart';
import 'modules/home_layout/home_layout.dart';
import 'modules/register_screen/cubit/register_cubit.dart';
import 'modules/search_screen/cubit/search_cubit.dart';
import 'network/Remote network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.int();

  Widget widget;
  bool isDark = CacheHelper.getData(key: 'isDark');

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  bool token = CacheHelper.getData(key: 'token');
  // ignore: avoid_print
  print(token);

  // ignore: unnecessary_null_comparison
  if (onBoarding != null) {
    // ignore: unnecessary_null_comparison
    if (token != null) {
      widget = HomeLayout();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const SplashScreen();
  }

  runApp(MyApp(
    startWidget: widget,
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.startWidget , this.isDark}) : super(key: key);

  final Widget? startWidget;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getHomeData(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => LayoutCubit()..changeAppMode(fromShared: isDark)),
        BlocProvider(create: (context) => ParagraphCubit()..getParagraph()),
        BlocProvider(create: (context) => QuestionsCubit()..getQuestion(1)),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => GetWantToReadBooksCubit()),
        BlocProvider(
          create: (BuildContext context) => ProfileCubit()..getUserProfile(),
        ),
        BlocProvider(create: (context) => PostScoreCubit()),
      ],
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              backgroundColor: ligthBackground,
              appBarTheme: const AppBarTheme(backgroundColor: ligthBackground),
              primaryColor: thirdColor,
              primarySwatch: Colors.lightGreen,
              fontFamily: 'Raleway',
              textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle1: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'OpenSans',
                    color: fifthColor,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle2: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: fifthColor)), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen).copyWith(secondary: secondColor),
            ),
            darkTheme: ThemeData(
              backgroundColor: fifthColor,
              primarySwatch: Colors.green,
              textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle1: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'OpenSans',
                    color: fourthColor,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle2: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: fourthColor)),
              appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,
                  backgroundColor: fifthColor,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
            debugShowCheckedModeBanner: false,
            themeMode: LayoutCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
            routes: {
              BookDetailsScreen.routePass: (context) =>
                   BookDetailsScreen(),
              PDFScreen.routePass: (context) => PDFScreen(),
              PDFCategoriesScreen.routePass: (context) => PDFCategoriesScreen(),
              PDFDevelopmentScreen.routePass: (context) =>
                  PDFDevelopmentScreen(),
              PDFScientificScreen.routePass: (context) => PDFScientificScreen(),
              PDFLiteratureScreen.routePass: (context) => PDFLiteratureScreen(),
            },
          );
        },
      ),
    );
  }
}
