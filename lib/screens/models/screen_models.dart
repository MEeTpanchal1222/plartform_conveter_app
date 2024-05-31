import 'package:flutter/cupertino.dart';
import '../calls_screen_tab/view/calls_tab_screen.dart';
import '../chat_screen/chat_tab.dart';
import '../person_add_tab/view/person_add_screen.dart';
import '../settings_screen/settings_tab.dart';

class ScreenModels {
  final Widget screen;

  ScreenModels({required this.screen});
}

List<ScreenModels> screenList = [
  ScreenModels(screen: PersonAddTab()),
  ScreenModels(screen: ChatTab()),
  ScreenModels(screen: CallsTab()),
  ScreenModels(screen: SettingScreen()),
];
