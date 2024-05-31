import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  ImagePicker picker = ImagePicker();
  File? profileImgPath;

  bool isdark = false;
  bool isProfile = false;

  TextEditingController txtfullname = TextEditingController();
  TextEditingController txtbio = TextEditingController();

  void profileImage() async {
    XFile? images = await picker.pickImage(source: ImageSource.camera);
    profileImgPath = File(images!.path);
    notifyListeners();
  }

  Future<void> setValues() async {
    if (isdark) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('dark', true);
    } else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('dark', false);
    }
    notifyListeners();
  }

  Future<void> getValues() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    isdark = preferences.getBool('dark') ?? false;
    notifyListeners();
  }

  ProfileProvider() {
    getValues();
  }
  void changeColor(bool value) {
    isdark = value;
    notifyListeners();
  }

  void profileshow(bool value) {
    isProfile = value;
    notifyListeners();
  }

  void clearprofile() {
    profileImgPath = null;
    txtfullname.clear();
    txtbio.clear();
    notifyListeners();
  }
}
