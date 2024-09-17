import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/cubit/app_cubits.dart';
import 'package:travel_app_flutter/cubit/app_cubit_logics.dart';
import 'package:travel_app_flutter/pages/detail_pages/cubit/store_page_info_cubits.dart';
import 'package:travel_app_flutter/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubits>(
            create: (context) => AppCubits(
              data: DataServices(),
            ),
          ),
          BlocProvider<StorePageInfoCubits>(
            create: (context) => StorePageInfoCubits(),
          ),
        ],
        child: const AppCubitLogics(),
      ),
    );
  }
}
