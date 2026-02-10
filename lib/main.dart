import 'package:events_app/core/routes/app_routers.dart';
import 'package:events_app/core/routes/page_route_name.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    initialRoute:PageRouteName.boarding,
        onGenerateRoute: AppRouters.onGenerateRoute ,);

  }
}
