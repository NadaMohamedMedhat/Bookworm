import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Reusable widgets

Widget defaultButton(
        // ignore: use_function_type_syntax_for_parameters
        {required void Function()? function(),
        required String text,
        required BuildContext context,
        double width = 170}) =>
    Container(
        decoration: BoxDecoration(
            color: thirdColor,
            borderRadius: const BorderRadius.all(Radius.circular(26.0)),
            border: Border.all(width: 1, color: thirdColor)),
        width: width,
        height: 55.0,
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ));

Widget defaultFormField(
        {required BuildContext context,
        required TextEditingController controller,
        required TextInputType inputType,
        String? Function(String?)? validate,
        Color? filledColor,
        required String label,
        required IconData? prefixIcon,
        IconData? suffixIcon,
        void Function()? onTapSuffixIcon,
        void Function(dynamic value)? onSubmit,
        void Function(dynamic value)? onChange,
        void Function()? onTap,
        bool isPasswordShown = false}) =>
    TextFormField(
      controller: controller,
      keyboardType: inputType,
      style: Theme.of(context).textTheme.subtitle2,
      onTap: onTap,onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate ??
          (input) {
            if (input?.isEmpty ?? true) {
              return 'input must not be empty';
            }
            return null;
          },
      obscureText: isPasswordShown,
      decoration: InputDecoration(
          focusColor: fourthColor,
          filled: true,
          fillColor: filledColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          hintText: label,
          hintStyle: const TextStyle(color: fifthColor),
          prefixIcon: Icon(
            prefixIcon,
            color: fifthColor,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: onTapSuffixIcon,
                  color: fifthColor,
                )
              : null
          //color: fourthColor,
          ,
          
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          )),
    );

void showToast({
  required String text,
  required ToastStates state,
}
) => Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
enum ToastStates {SUCCESS,ERROR}
Color? chooseToastColor(ToastStates state)
{
    switch(state) {
      case ToastStates.SUCCESS:
        return  Colors.green;
        break;

      case ToastStates.ERROR:
        return Colors.red;
        break;
    }
}

/// Reusable Functions

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

// Function navigate to next screen and cant be able to return to it
void navigateToAndBurn(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      result: (Route<dynamic> route) => false,
    );

///  Constant colors

const Color firstColor = Color.fromRGBO(38, 108, 170, 1); // 266CAA
const Color secondColor = Color.fromRGBO(77, 179, 184, 5); // 4DB3B8
const Color thirdColor = Color.fromRGBO(6, 152, 139, 1); // 06988B
const Color fourthColor = Color.fromRGBO(255, 255, 255, 1); // FFFFFFF
const Color fifthColor = Color.fromRGBO(36, 34, 44, 1);        // 000000
//const Color sixthColor = Color.fromRGBO(250, 250, 250, 1);
//
String token ="" ;
