import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Function onPressed;
  const RoundedButton(
      {Key? key,
      required this.name,
      required this.height,
      required this.width,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          name,
          style: TextStyle(fontSize: 22, color: Colors.black, height: 1.5),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.blue),
    );
  }
}

class RoundedButtonDelete extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Function onPressed;
  const RoundedButtonDelete(
      {Key? key,
      required this.name,
      required this.height,
      required this.width,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          name,
          style: TextStyle(fontSize: 22, color: Colors.black, height: 1.5),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.red),
    );
  }
}
