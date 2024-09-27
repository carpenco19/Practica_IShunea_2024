// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/cubit/app_cubit.dart';
import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/misc/colors.dart';
import 'package:travel_app_flutter/pages/detail_pages/cubit/store_page_info_cubits.dart';
import 'package:travel_app_flutter/widgets/app_buttons.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';
import 'package:travel_app_flutter/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStarts = 4;
  int selectedIndex = 1;
  Color? color = AppColors.mainColor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detailState = state as DetailState;
      var list = BlocProvider.of<StorePageInfoCubits>(context).state;
      for (int i = 0; i < list.length; i++) {
        if (list[i].name == detailState.place.name) {
          selectedIndex = list[i].index!;
          color = list[i].color;
        }
      }

      return Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/${detailState.place.img}"),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 240,
                child: Container(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detailState.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$${detailState.place.price.toString()}",
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < detailState.place.stars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          })),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "(5.0)",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                      ]),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "Number of people in group",
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => InkWell(
                            onTap: () {
                              var data = state.place;
                              var list =
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .state;
                              for (int i = 0; i < list.length; i++) {
                                if (list[i].name == data.name) {
                                  if (list[i].index == index) {
                                  } else {
                                    print('updating info');
                                    BlocProvider.of<StorePageInfoCubits>(
                                            context)
                                        .updatePageInfo(
                                            data.name, index, color);
                                  }
                                }
                              }
                              //only if a button was never clicked
                              if (selectedIndex == -1) {
                                print('inside a condition');
                                BlocProvider.of<StorePageInfoCubits>(context)
                                    .addPageInfo(
                                        detailState.place.name, index, color);
                              }

                              //BlocProvider.of<StorePageInfoCubits>(context).addPageInfo(detailState.place.name, index);
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                text: (index + 1).toString(),
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8)),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                          text: detailState.place.description,
                          color: AppColors.mainTextColor),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 28,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          var list =
                              BlocProvider.of<StorePageInfoCubits>(context)
                                  .state;
                          if (list.isEmpty) {
                            setState(() {
                              color = Colors.red;
                            });
                            BlocProvider.of<StorePageInfoCubits>(context)
                                .updatePageWish(detailState.place.name,
                                    selectedIndex, color);
                          } else {
                            //only toggle the color
                            for (int i = 0; i < list.length; i++) {
                              if (list[i].name == detailState.place.name) {
                                if (list[i].color == Colors.red) {
                                  setState(() {
                                    color = AppColors.mainColor;
                                  });
                                  Future.delayed(Duration.zero, () {
                                    // ignore: use_build_context_synchronously
                                    BlocProvider.of<StorePageInfoCubits>(
                                            // ignore: use_build_context_synchronously
                                            context)
                                        .updatePageWish(detailState.place.name,
                                            selectedIndex, color);
                                  });
                                  return;
                                } else {
                                  setState(() {
                                    color = Colors.red;
                                  });
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .updatePageWish(detailState.place.name,
                                          selectedIndex, color);
                                }
                                return;
                              } else {
                                if (color == AppColors.mainColor) {
                                  setState(() {
                                    color = Colors.red;
                                  });
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .updatePageWish(detailState.place.name,
                                          selectedIndex, color);
                                } else {
                                  setState(() {
                                    color == AppColors.mainColor;
                                  });
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .updatePageWish(detailState.place.name,
                                          selectedIndex, color);
                                }
                              }
                            }
                          }
                        },
                        child: AppButtons(
                            color: AppColors.textColor1,
                            backgroundColor: Colors.white,
                            size: 60,
                            isIcon: true,
                            icon: Icons.favorite_border,
                            borderColor: color!),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}


/*AppButtons(
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          size: 60,
                          isIcon: true,
                          icon: Icons.favorite_border,
                          borderColor: AppColors.textColor1),*/