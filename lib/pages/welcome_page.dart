import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/cubit/app_cubit.dart';
import 'package:travel_app_flutter/misc/colors.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';
import 'package:travel_app_flutter/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            // first parameter context and second parameter is index
            //we want to scroll up and down
            return Container(
              width: double.maxFinite, // max width and height
              height: double.maxFinite,
              decoration: BoxDecoration(
                // decoration sets the background
                image: DecorationImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    image: AssetImage("img/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: "Trips",
                        ),
                        AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            color: AppColors.textColor2,
                            size: 14,
                            text:
                                "Mountain Hikes gives you an incredible sense of freedom along with endurance tests",
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .getData(); // we can run any method from the state usisng the block provider
                          },
                          // ignore: sized_box_for_whitespace
                          child: Container(
                              width: 200,
                              child: Row(
                                  children: [ResponsiveButton(width: 120)])),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                          3,
                          (indexDots) => Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                width: 8,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots
                                      ? AppColors.mainColor
                                      : AppColors.mainColor.withOpacity(0.3),
                                ),
                              )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
