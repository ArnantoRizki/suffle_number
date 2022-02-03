import 'package:flutter/material.dart';
import 'home_square.dart';
import '../../blocs/geser_bloc/geser_bloc.dart';
import '../../constants/const_size.dart' as const_size;
import '../../configs/size_config.dart';


class HomeBoard extends StatelessWidget {
  final List<SquareModel> squares;
  final void Function(SquareModel) onTapSquare;

  const HomeBoard({ 
    Key? key,
    required this.squares,
    required this.onTapSquare
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: SizeConfig.of(context).sizeBoard,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Stack(
          children: squares.map((e) 
            => Positioned(
              left: (e.indexCurrent % 3) * SizeConfig.of(context).sizeSquare,
              top: (e.indexCurrent - (e.indexCurrent % 3)) * SizeConfig.of(context).sizeSquare / 3,
              child: Padding(
                padding: const EdgeInsets.all(const_size.kSquarePadding),
                child: GestureDetector(
                  onTap: () {
                    onTapSquare(e);
                  },
                  child: HomeSquare(
                    size: SizeConfig.of(context).sizeSquare - (2 * const_size.kSquarePadding),
                    content: Center(
                      child: Text(
                        "${e.show}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}