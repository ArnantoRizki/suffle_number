import 'package:flutter_bloc/flutter_bloc.dart';
import 'slide_bloc_event.dart';
import 'slide_bloc_state.dart';
import '../models/square_model.dart';

export 'slide_bloc_event.dart';
export 'slide_bloc_state.dart';



class SlideBloc extends Bloc<SlideBlocEvent, SlideBlocState>{
  SlideBloc() : super(SlideBlocState(
    squares: List<int>.generate(8, (index) => index).map(
      (e) => SquareModel(
        indexReal: e,
        indexCurrent: e,
        show: e + 1
      )
    ).toList(),
    emptySlot: 8
  ))  {
    on<SlideBlocEventRandomize>((event, emit) {
      emit(state.copyWith(
        squares: SlideBlocState.randomizer()
      ));
    });

    on<SlideBlocEventMove>((event, emit) {
      final _square = event.square;
      var _squares = List<SquareModel>.from(state.squares);

      if((state.emptySlot - _square.indexCurrent).abs() == 3 || (state.emptySlot - _square.indexCurrent).abs() == 1){
        var _slot = SquareModel(
          indexCurrent: state.emptySlot,
          indexReal: _square.indexReal,
          show: _square.show
        );
        
        _squares[_square.indexReal] = _slot;
      }

      emit(state.copyWith(
        squares: List<SquareModel>.from(_squares)
      ));
    });
  } 
}