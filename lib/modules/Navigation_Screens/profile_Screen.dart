import 'package:events_app/core/theme/color_pallette/color_pallette.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorPallete.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("welcome in Profile screen")],
      ),
    );
  }
}
