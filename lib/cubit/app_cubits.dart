import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubit/app_cubit_states.dart';
/*import 'package:flutter_project/model/data_model.dart';*/
import 'package:flutter_project/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;
  AppCubits(this.data) : super(InitialState()) {
    emit(WelcomeState());
  }
}

void getData() async {
  // ignore: avoid_print
/*
  try {
      emit(LoadingState());
      places = await data.getInfo();
      print(await data.getInfo()); //getting info from the server
      print("palces at app_cutibt");
      print(places);
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }*/
}
