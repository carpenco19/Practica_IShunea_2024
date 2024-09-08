import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubit/app_cubits.dart';
import 'package:flutter_project/mics/colors.dart';
import 'package:flutter_project/widgets/app_large_text.dart';
import 'package:flutter_project/widgets/app_text.dart';
import 'package:flutter_project/widgets/responsive_button.dart';

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
          itemCount: 3,
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
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: index == 1
                    ? const Text("Seond")
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppLargeText(
                                text: "Trips",
                              ),
                              const AppText(
                                text: "Mountain",
                                size: 30,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                width: 250,
                                child: AppText(
                                  color: AppColors.textColor1,
                                  text:
                                      "Mountain Hikes gives you an incredible sense of freedom along with endurance tests",
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AppCubits>(
                                      context); // we can run any method from the state usisng the block provider
                                },
                                child: ResponsiveButton(
                                  width: 120,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: List.generate(
                                3,
                                (indexDots) => Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      width: 8,
                                      height: index == indexDots ? 25 : 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index == indexDots
                                            ? AppColors.mainColor
                                            : AppColors.mainColor
                                                .withOpacity(0.3),
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
