import 'package:equatable/equatable.dart';
import 'package:travel_app_flutter/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
// TODO: implement props
  List<Object> props() => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> props() => []; // `props` gol, fără variabile de comparat
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> props() => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;

  @override
  // TODO: implement props
  List<Object> props() => [places];
}

class DetailState extends CubitStates {
  DetailState(this.place);
  final DataModel place;

  @override
  // TODO: implement props
  List<Object> props() => [place];
}
