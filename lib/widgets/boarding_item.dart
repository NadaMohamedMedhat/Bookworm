import 'package:flutter/material.dart';
import 'package:graduation_project/models/onBoarding_model.dart';

// ignore: non_constant_identifier_names
Widget BoardingItem(OnBoardingModel model, BuildContext context) => Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
            width: 300,
            height: 300,
          ),
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          model.body,
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
      ],
    );
