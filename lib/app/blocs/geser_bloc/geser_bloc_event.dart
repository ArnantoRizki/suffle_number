import 'package:equatable/equatable.dart';
import 'package:geser/app/blocs/geser_bloc/geser_bloc.dart';


abstract class GeserBlocEvent extends Equatable{
  const GeserBlocEvent();

  @override
  List<Object?> get props => [];
}

class GeserBlocEventRandomize extends GeserBlocEvent{}
class GeserBlocEventPindah extends GeserBlocEvent{
  final SquareModel square;

  const GeserBlocEventPindah(this.square);

  @override
  List<Object?> get props => [square];
}