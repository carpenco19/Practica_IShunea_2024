import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/cubit/app_cubits.dart';
import 'package:travel_app_flutter/misc/colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detailState = state as DetailState;
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
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
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
                              color: Colors.black54.withOpacity(0.8),
                            ),
                            AppLargeText(
                                text: "\$${detailState.place.price.toString()}",
                                color: AppColors.mainColor)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: detailState.place.location,
                            color: AppColors.textColor1,
                          ),
                        ]),
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
                        const SizedBox(height: 10),
                        AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        const SizedBox(height: 5),
                        AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8)),
                        const SizedBox(height: 5),
                        AppText(
                            text: detail.places.description,
                            color: AppColors.mainTextColor),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          size: 60,
                          isIcon: true,
                          icon: Icons.favorite_border,
                          borderColor: AppColors.textColor1),
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
