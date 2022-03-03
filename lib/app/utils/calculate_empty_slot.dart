import 'package:geser/app/pages/home_page/models/square_model.dart';

int emptySlotOnRandom(List<SquareModel> squares){
  int count = 0;

  for (var square in squares){
    count += square.indexCurrent;
  }

  return 36 - count;
}