import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.controller,
    this.hintText = '',
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      style: const TextStyle(fontFamily: 'Roboto'),
      decoration: InputDecoration(
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Color(0xbb000000),
          //   ),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //       color: Theme.of(context).primaryColor.withOpacity(0.5),
          //       width: 2),
          // ),
          border: const OutlineInputBorder(),
          //hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          fillColor: const Color(0xffffffff)),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
