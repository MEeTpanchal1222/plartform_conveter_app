import 'dart:io';

import 'package:flutter/material.dart';

class PersonDataModel {
  String? name, phoneNumber, chatConversation;
  DateTime? date;
  TimeOfDay? timeOfDay;
  File? imgPath;

  PersonDataModel(
      {this.name,
      this.phoneNumber,
      this.chatConversation,
      this.date,
      this.imgPath,
      this.timeOfDay});
}
