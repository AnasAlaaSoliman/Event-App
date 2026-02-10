import 'package:events_app/core/routes/page_route_name.dart';
import 'package:events_app/modules/Entry_pages/login_page.dart';
import 'package:events_app/modules/Entry_pages/register_page.dart';
import 'package:events_app/modules/Navigation_Screens/navigationPage.dart';
import 'package:events_app/modules/boarding_screens/BoardingScreen().dart';
import 'package:events_app/modules/Event_Updates/eventDetails.dart';
import 'package:flutter/material.dart';

abstract class AppRouters {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
      switch (settings.name){
      case PageRouteName.boarding:
        return MaterialPageRoute(builder: (context)=>Boardingscreen() );
    }

      switch (settings.name){
        case PageRouteName.login:
          return MaterialPageRoute(builder: (context)=>LoginPage() );
      }

      switch (settings.name){
        case PageRouteName.RegisterPage:
          return MaterialPageRoute(builder: (context)=>RegisterPage() );
      }

      switch (settings.name) {
        case PageRouteName.home:
          return MaterialPageRoute(builder: (context) => Homepage());
      }


  }
}
