import 'package:flutter/material.dart';
import 'package:travel_app_flutter/misc/colors.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  String text;
  ResponsiveButton({
    super.key,
    this.width = 120,
    this.isResponsive = false,
    this.text = "",
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin:const EdgeInsets.only(left: 20),
                child: AppText(text: "Book trip now", color:Colors.white)):Container(),
            Image.asset("img/button-one.png")
          ],
        ),
      ),
    );
  }
}