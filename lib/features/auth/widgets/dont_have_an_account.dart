import 'package:flutter/material.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(
          text: 'Don\'t have an Account? ',
          style: TextStyle(color: Colors.white)),
      WidgetSpan(
        child: InkWell(
          onTap: onTap,
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Color.fromARGB(255, 176, 163, 46)),
          ),
        ),
      ),
    ]));
  }
}
