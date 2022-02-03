import 'package:flutter/material.dart';
import '../../configs/size_config.dart';


class HomeButton extends StatelessWidget {
  final void Function()? onTap;

  const HomeButton({
    Key? key,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.of(context).sizeBoard,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white
        ),
        child: Center(
          child: Text(
            "Randomize",
            style: TextStyle(
              fontSize: 20.0,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}