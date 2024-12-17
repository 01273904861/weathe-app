import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(
          text: 'Already have an Account? ',
          style: TextStyle(color: Colors.white)),
      WidgetSpan(
        child: InkWell(
          onTap: onTap,
          child: const Text(
            ' Sign In',
            style: TextStyle(color: Color.fromARGB(255, 176, 163, 46)),
          ),
        ),
      )
    ]));
  }
}
