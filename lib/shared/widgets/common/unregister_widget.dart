// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panshop_driver/core/constants/diemsions/size_extensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/shared/widgets/buttons/cutstom_button.dart';

class UnregisterWidget extends StatelessWidget {
  const UnregisterWidget({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String buttonTitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        16.shb,
        Text(title, style: textTheme.bodyLarge),
        16.shb,
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
          label: buttonTitle,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
