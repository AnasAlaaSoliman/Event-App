import 'package:events_app/core/routes/app_routers.dart';
import 'package:events_app/core/routes/page_route_name.dart';
import 'package:events_app/modules/Entry_pages/login_page.dart';
import 'package:events_app/modules/boarding_screens/boarding_screen_cards.dart';
import 'package:events_app/core/theme/color_pallette/color_pallette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Boardingscreen extends StatefulWidget {
  @override
  State<Boardingscreen> createState() => _BoardingscreenState();
}

class _BoardingscreenState extends State<Boardingscreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(

      globalBackgroundColor: ColorPallete.background,

      rawPages: [
        BoardingScreenCards(
          imageName: "assets/images/light/hot-trending.png",
          pageMainText: "Find Events That Inspire You",
          pageDescription:
              "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
        ),
        BoardingScreenCards(
          imageName: "assets/images/light/being-creative (3).png",
          pageMainText: "Effortless Event Planning",
          pageDescription:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
        ),BoardingScreenCards(
          imageName: "assets/images/light/being-creative (1).png",
          pageMainText: "Connect with Friends & Share Moments",
          pageDescription:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
        ),
      ],

      showBackButton: false,
      showNextButton: true,
      showSkipButton: true,



      overrideNext: (context, onNext) {
        return SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPallete.main_blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },

      overrideDone: (context, onDone) {
        return SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: onDone,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPallete.main_blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              "Get started",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },


      dotsDecorator: const DotsDecorator(
        activeColor: ColorPallete.dark_main_blue,
        color: Colors.grey,
        size: Size(10, 10),
        activeSize: Size(15, 10),
      ),

      next: const Text(
        "Next",
        style: TextStyle(
          color: ColorPallete.main_blue,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      back: const Text(
        "Back",
        style: TextStyle(
          color: ColorPallete.main_blue,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      done: const Text(
        "Finish",
        style: TextStyle(
          color: ColorPallete.main_blue,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      skip: const Text("Skip"),
      onDone: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => LoginPage()),
              (route) => false,
        );
      },
    );
  }
}
