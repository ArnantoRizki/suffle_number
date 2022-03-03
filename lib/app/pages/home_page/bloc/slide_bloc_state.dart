import 'package:equatable/equatable.dart';
import 'package:geser/app/utils/calculate_empty_slot.dart';
import '../models/square_model.dart';

class SlideBlocState extends Equatable{
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

  @override
  List<Object?> get props => [squares, emptySlot];
}