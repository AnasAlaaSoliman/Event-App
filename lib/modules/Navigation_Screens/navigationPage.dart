import 'package:events_app/core/theme/color_pallette/color_pallette.dart';
import 'package:events_app/modules/Event_Updates/add_event.dart';
import 'package:events_app/modules/Navigation_Screens/favorite_Screen.dart';
import 'package:events_app/modules/Navigation_Screens/home_screen.dart';
import 'package:events_app/modules/Navigation_Screens/profile_Screen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int page_index = 0;

  List<Widget>screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorPallete.main_blue,
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          child: Icon(Icons.add),

          onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddEvent()));
      }),
      backgroundColor: ColorPallete.background,
      bottomNavigationBar: BottomNavigationBar(

        onTap: (x) {
          setState(() {
            page_index = x;
          });
        },

        currentIndex: page_index,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,

        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home-2.png", height: 40,
              width: 40,),
            activeIcon: Image.asset("assets/icons/home.png", height: 40,
              width: 40,),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/heart1.png", height: 40,
              width: 40,),
            activeIcon: Image.asset("assets/icons/heart.png", height: 40,
              width: 40,),
            label: "Favorite",
          ),

          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/user1.png", height: 40,
              width: 40,),
            activeIcon: Image.asset("assets/icons/user.png", height: 40,
              width: 40,),
            label: "Profile",
          ),

        ],
      ),
      body: screens[page_index],
    );
  }
}
