import 'package:flutter/material.dart';
import 'package:plartform_conveter_app/screens/chat_screen/providers/chat_provider.dart';
import 'package:plartform_conveter_app/screens/main_screen/main_screen.dart';
import 'package:plartform_conveter_app/screens/person_add_tab/providers/person_add_provider.dart';
import 'package:plartform_conveter_app/screens/settings_screen/providers/settings_provider.dart';
import 'package:plartform_conveter_app/utils/global%20provider/switch_provider.dart';

import 'package:provider/provider.dart';



void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SwitchProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PersonAddProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
    ),
  ], builder: (context, child) => PlatformConvertor()));
}

class PlatformConvertor extends StatelessWidget {
  const PlatformConvertor({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}