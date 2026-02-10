import 'package:flutter/cupertino.dart';

class BoardingScreenCards extends StatelessWidget {
  String imageName;

  String pageMainText;
  String pageDescription;

  BoardingScreenCards({
    required this.imageName,
    required this.pageMainText,
    required this.pageDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15,),
          Image.asset(
            "assets/images/light/Group 1 (1).png",
            height: 150,
          ),

          Image.asset(imageName),
          SizedBox(height: 25),
          Text(
            pageMainText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 16),
          Text(
            pageDescription,textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
