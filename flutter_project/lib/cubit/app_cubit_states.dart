import 'package:equatable/equatable.dart';
import 'package:travel_app_flutter/model/data_model.dart';

abstract class CubitStates extends Equatable {
  // Nu este nevoie să definim `props` aici, deoarece Equatable furnizează acest lucru
}

class InitialState extends CubitStates {
  final int x; // Variabilă finală

  InitialState(this.x); // Constructor pentru inițializarea lui `x`

  @override
  List<Object> get props => [x]; // Suprascrierea getter-ului `props`
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => []; // `props` gol, fără variabile de comparat
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  final List<DataModel> places;

  LoadedState(this.places);

  @override
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  final DataModel place;

  DetailState(this.place);

  @override
  List<Object> get props => [place];
}







