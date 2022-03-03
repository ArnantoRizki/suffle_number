import 'package:equatable/equatable.dart';
import '../models/square_model.dart';


abstract class SlideBlocEvent extends Equatable{
  const SlideBlocEvent();

  @override
  List<Object?> get props => [];
}

class SlideBlocEventRandomize extends SlideBlocEvent{}
class SlideBlocEventMove extends SlideBlocEvent{
  final SquareModel square;

  const SlideBlocEventMove(this.square);

  @override
  List<Object?> get props => [square];
}