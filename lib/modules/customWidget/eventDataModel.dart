import 'package:flutter/material.dart';

class EventModel {
  final Image image;
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;

  EventModel({
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });
}