library primary_button;

import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool isSecure;
  final FieldType fieldType;
  final FormFieldValidator<String?>? validator;
  final Function(String)? onChanged;
  final String secureCharacter;
  final int? maxLines;
  const PrimaryTextField({
    Key? key,
    required this.hint,
    this.controller,
    this.maxLines = 1,
    this.fieldType = FieldType.Simple,
    this.onChanged,
    this.textInputType,
    this.validator,
    this.secureCharacter = "•",
    this.isSecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: getDecoration(fieldType),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        maxLines: maxLines,
        obscureText: isSecure,
        obscuringCharacter: secureCharacter,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  BoxDecoration getDecoration(FieldType fieldType) {
    switch (fieldType) {
      case FieldType.Simple:
        return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        );
      case FieldType.Outlined:
        return BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(4),
        );
    }
  }
}

enum FieldType { Simple, Outlined }

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return "Email cannot be empty";
  }

  if (!email.contains("@")) {
    return "invalid email";
  }

  return null;
}
