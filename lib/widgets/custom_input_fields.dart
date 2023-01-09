import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  final Function(String) onsave;
  final String hintText;
  final String labelText;
  final bool autofocus;
  bool obscureText;
  TextInputAction? textInputAction;

  CustomTextFormField(
      {Key? key,
      required this.onsave,
      required this.hintText,
      required this.labelText,
      required this.validator,
      required this.keyboardType,
      required this.autofocus,
      required this.textInputAction,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: textInputAction,
        onSaved: (_value) => onsave(_value!),
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            labelStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
        keyboardType: keyboardType,
        obscureText: obscureText,
        autofocus: autofocus,
        validator: validator);
  }
}

class CustomTextFormFieldDefault extends StatelessWidget {
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  final Function(String) onsave;
  final String hintText;
  final String labelText;
  final bool autofocus;
  bool obscureText;
  final String? initialValue;

  CustomTextFormFieldDefault(
      {Key? key,
      required this.onsave,
      required this.hintText,
      required this.labelText,
      required this.validator,
      required this.keyboardType,
      required this.autofocus,
      required this.obscureText,
      required this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: initialValue,
        onSaved: (_value) => onsave(_value!),
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            labelStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
        keyboardType: keyboardType,
        obscureText: obscureText,
        autofocus: autofocus,
        validator: validator);
  }
}
