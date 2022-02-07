import 'package:flutter_bloc/flutter_bloc.dart';
import 'geser_bloc_event.dart';
import 'geser_bloc_repository.dart';
import 'geser_bloc_state.dart';

export 'geser_bloc_event.dart';
export 'geser_bloc_repository.dart';
export 'geser_bloc_state.dart';



class GeserBloc extends Bloc<GeserBlocEvent, GeserBlocState>{
  GeserBloc() : super(GeserBlocStateInit()){
    on<GeserBlocEventRandomize>((event, emit) {
      emit(GeserBlocStateRandomized(
        state.repository.copyWith(
          squares: GeserBlocRepository.randomizer()
        )
      ));
    });

    on<GeserBlocEventPindah>((event, emit) {
      final _square = event.square;
      var _squares = List<SquareModel>.from(state.repository.squares);

      if((state.repository.emptySlot - _square.indexCurrent).abs() == 3 || (state.repository.emptySlot - _square.indexCurrent).abs() == 1){
        var _slot = SquareModel(
          indexCurrent: state.repository.emptySlot,
          indexReal: _square.indexReal,
          show: _square.show
        );
        
        _squares[_square.indexReal] = _slot;
      }

      emit(GeserBlocStateDipindahSuccess(
        state.repository.copyWith(
          squares: List<SquareModel>.from(_squares)
        )
      ));
    });
  } 
}