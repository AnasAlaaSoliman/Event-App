import 'package:events_app/core/theme/color_pallette/color_pallette.dart';
import 'package:events_app/modules/Event_Updates/eventDetails.dart';
import 'package:events_app/modules/customWidget/eventDataModel.dart';
import 'package:events_app/modules/customWidget/tab_custom.dart';
import 'package:events_app/modules/customWidget/textfield.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  final EventModel? eventToEdit;

  const AddEvent({super.key, this.eventToEdit});
  @override
  State<AddEvent> createState() => _AddEventState();
}


class _AddEventState extends State<AddEvent> {
  @override
  void initState() {
    super.initState();

    if (widget.eventToEdit != null) {
      final event = widget.eventToEdit!;

      titleController.text = event.title;
      descriptionController.text = event.description;
      selectedDate = event.date;
      selectedTime = event.time;

      currenIndex = tabImages.indexWhere(
            (img) => img.image == event.image.image,
      );
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int currenIndex = 0;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<Image> tabImages = [
    Image.asset("assets/images/light/bookClub.png"),
    Image.asset("assets/images/light/sport.png"),
    Image.asset("assets/images/light/Birthday.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: ColorPallete.background,
        centerTitle: true,
        title: Text(
          "Add Event",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              //padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: tabImages[currenIndex],
            ),

            DefaultTabController(
              length: 3,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    currenIndex = index;
                  });
                },
                tabAlignment: TabAlignment.center,
                isScrollable: true,

                dividerColor: Colors.transparent,
                indicator: BoxDecoration(),

                //unselectedLabelColor: Colors.pink,
                tabs: [
                  TabCustom(
                    isSelected: currenIndex == 0,
                    imagePath: Icons.menu_book_rounded,
                    text: "Book Club",
                  ),
                  TabCustom(
                    isSelected: currenIndex == 1,
                    text: "Sport",
                    imagePath: Icons.directions_bike,
                  ),
                  TabCustom(
                    isSelected: currenIndex == 2,
                    text: "Birthday",
                    imagePath: Icons.cake_outlined,
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Title",

                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),

                  //////////textfield
                  TextField(
                    controller: titleController,
                    style: TextStyle(color: ColorPallete.main_text),
                    decoration: InputDecoration(
                      hintText: "Event Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 5,
                    style: TextStyle(color: ColorPallete.main_text),
                    decoration: InputDecoration(
                      hintText: "Event Description....",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: ColorPallete.main_blue,
                            ),
                            Text(
                              "Event Date",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: ColorPallete.main_text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => pickDate(context),
                        child: Text(
                          selectedDate == null
                              ? "Choose date"
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: ColorPallete.main_blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: ColorPallete.main_blue,
                            ),
                            Text(
                              "Event Time",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: ColorPallete.main_text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => pickTime(context),
                        child: Text(
                          selectedTime == null
                              ? "Choose time"
                              : selectedTime!.format(context),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: ColorPallete.main_blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(
                    onPressed: ()  {
                      if (titleController.text.isEmpty ||
                          descriptionController.text.isEmpty ||
                          selectedDate == null ||
                          selectedTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Empty Field")),
                        );
                        return;
                      }

                      EventModel event = EventModel(
                        image: tabImages[currenIndex],
                        title: titleController.text,
                        description: descriptionController.text,
                        date: selectedDate!,
                        time: selectedTime!,
                      );


                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Eventdetails(eventdata: event,);
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallete.main_blue,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                  widget.eventToEdit == null ? "Add Event" : "Update Event",
                      style: TextStyle(
                        color: ColorPallete.dark_main_text,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
