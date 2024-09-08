import 'package:flutter/material.dart';
/*import 'package:flutter/widgets.dart';*/

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: const Stack(
            /*children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/mountain.jpeg")
                  fit:BoxFit.cover
                ),
              ),

              ),
            )
             Positioned(
              left: 20,
              top: 50,
              child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.menu),
                color: Colors.white,
                )
              ],
            ))
            Positioned(
              )
          ],*/
            ),
      ),
    );
  }
}
