import 'package:flutter/material.dart';

class SignInTextField extends StatelessWidget {
  final String text;
  final dynamic onChanged;
  final dynamic validator;

  const SignInTextField(
      {super.key, required this.text, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            onChanged: onChanged,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
