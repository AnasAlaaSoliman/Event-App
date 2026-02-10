import 'package:events_app/core/theme/color_pallette/color_pallette.dart';
import 'package:events_app/modules/Event_Updates/add_event.dart';
import 'package:events_app/modules/Navigation_Screens/navigationPage.dart';
import 'package:events_app/modules/customWidget/eventDataModel.dart';
import 'package:flutter/material.dart';

class Eventdetails extends StatelessWidget {
  final EventModel eventdata;

  const Eventdetails({super.key, required this.eventdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: ColorPallete.background,
        centerTitle: true,
        title: Text(
          "Event details",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),

        actionsPadding: EdgeInsets.all(15),
        actions: [
          InkWell(
            onTap: () async {
              final updatedEvent = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEvent(eventToEdit: eventdata),
                ),
              );

              if (updatedEvent != null) {
                Navigator.pop(context, updatedEvent);
              }
            },
            child: Image.asset(
              "assets/icons/edit-2.png",
              height: 30,
              width: 30,
            ),
          ),

          SizedBox(width: 15),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Homepage(),
                ),
                (route) => false,
              );
            },
            child: Image.asset("assets/icons/trash.png", height: 30, width: 30),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            //padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: eventdata.image,
          ),
          Container(
            alignment: AlignmentGeometry.centerLeft,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              //color: Colors.white,
            ),
            child: Text(
              eventdata.title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),

          Container(
            height: 80,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_month, color: ColorPallete.main_blue),
                SizedBox(width: 15),
                Column(
                  children: [
                    Text(
                      "${eventdata.date.day}/${eventdata.date.month}/${eventdata.date.year}",
                    ),
                    Text(eventdata.time.format(context)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              //color: Colors.white,
            ),
            child: Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),

          Container(
            alignment: Alignment.topLeft,
            height: 203,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Text(
              eventdata.description,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
