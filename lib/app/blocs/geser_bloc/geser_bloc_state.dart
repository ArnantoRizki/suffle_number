import 'package:equatable/equatable.dart';
import 'geser_bloc_repository.dart';


abstract class GeserBlocState extends Equatable{
  final GeserBlocRepository repository;

  const GeserBlocState(this.repository);

  @override
  List<Object?> get props => [repository];
}

class GeserBlocStateInit extends GeserBlocState{
  GeserBlocStateInit() : super(GeserBlocRepository(
    squares: List<int>.generate(8, (index) => index).map(
      (e) => SquareModel(
        indexReal: e,
        indexCurrent: e,
        show: e + 1
      )
    ).toList(),
    emptySlot: 8
  ));

  @override
  List<Object?> get props => [repository];
}

class GeserBlocStateRandomized extends GeserBlocState{
  const GeserBlocStateRandomized(GeserBlocRepository repository) : super(repository);

  @override
  List<Object?> get props => [repository];
}

class GeserBlocStateDipindahSuccess extends GeserBlocState{
  const GeserBlocStateDipindahSuccess(GeserBlocRepository repository) : super(repository);

  @override
  List<Object?> get props => [repository];
}
