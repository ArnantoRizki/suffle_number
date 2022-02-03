import 'package:flutter/material.dart';


class SizeConfig{
  final double sizeBoard;
  final double sizeSquare;

  SizeConfig({
    this.sizeBoard = 0.0,
    this.sizeSquare = 0.0,
  });

  static SizeConfig of(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);

    final _orientation = _mediaQuery.orientation;
    final _sizeBoard = _orientation == Orientation.landscape?
                        _mediaQuery.size.height * 0.9 :
                        _mediaQuery.size.width * 0.9;
    final _sizeSquare = (_sizeBoard / 3);

    return SizeConfig(
      sizeBoard: _sizeBoard,
      sizeSquare: _sizeSquare
    );
  }
}