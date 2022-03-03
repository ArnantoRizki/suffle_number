import 'dart:math';
import '../models/square_model.dart';


class SlideBlocState {
  final List<SquareModel> squares;
  final int emptySlot;

  const SlideBlocState({
    required this.squares,
    required this.emptySlot
  });

  SlideBlocState copyWith({
    List<SquareModel>? squares,
  }) => SlideBlocState(
    squares: squares ?? this.squares,
    emptySlot: emptySlotOnRandom(squares ?? this.squares)
  );


  static List<SquareModel> randomizer() {
    var random = Random();
    List<SquareModel> randomized = List<SquareModel>.generate(8, (index) => SquareModel(
      indexReal: index,
      indexCurrent: index,
      show: index + 1
    ));
    bool flag = true;

    for(int i=0; i <= randomized.length; i++){
      var r = i + random.nextInt(randomized.length + 1 - i);
      
      if(r < randomized.length && i < randomized.length){
        var tmp = randomized[i];

        randomized[i] = SquareModel(
          indexReal: randomized[i].indexReal,
          indexCurrent: randomized[r].indexCurrent,
          show: randomized[i].show
        );

        randomized[r] = SquareModel(
          indexReal: randomized[r].indexReal,
          indexCurrent: tmp.indexCurrent,
          show: randomized[r].show
        );
      }else if(i < randomized.length){
        if(flag){
          randomized[i] = SquareModel(
            indexReal: randomized[i].indexReal,
            indexCurrent: r,
            show: randomized[i].show
          );

          flag = false;
        }
      }
    }


    return List<SquareModel>.from(randomized);
  }

  static int emptySlotOnRandom(List<SquareModel> squares){
    int count = 0;

    for (var square in squares){
      count += square.indexCurrent;
    }

    return 36 - count;
  }
}