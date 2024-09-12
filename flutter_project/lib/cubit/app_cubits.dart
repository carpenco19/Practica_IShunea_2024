import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/model/data_model.dart';
import 'package:travel_app_flutter/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits(DataServices dataServices, {required this.data})
      : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
      // ignore: empty_catches
    } catch (e) {}
  }

// ignore: non_constant_identifier_names
  DetailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
