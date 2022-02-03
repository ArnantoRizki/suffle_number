import 'package:flutter/material.dart';


class HomeSquare extends StatelessWidget {
  final Widget content;
  final double size;

  const HomeSquare({
    Key? key,
    required this.content,
    required this.size
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white,
        ),
        child: content
      ),
    );
  }
}