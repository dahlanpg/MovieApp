// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? title_size;
  final bool disable;
  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.title_size,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      child: Text(title),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled))
              return Colors.red.shade300;
            if (states.contains(MaterialState.pressed))
              return Colors.blue.shade200;
            return Colors.green;
          }),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed))
              return TextStyle(
                fontSize: title_size != null ? title_size! * 1.5 : 24,
              );
            return TextStyle(fontSize: title_size);
          })),
    );
  }
}
