import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../screens/calls_screen_tab/view/calls_tab_screen.dart';
import '../screens/chat_screen/chat_tab.dart';
import '../screens/person_add_tab/view/person_add_screen.dart';
import '../screens/settings_screen/settings_tab.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveTabBar extends StatelessWidget {
  const AdaptiveTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? TabBarView(children: [
            PersonAddTab(),
            SingleChildScrollView(child: ChatTab()),
            CallsTab(),
            SettingScreen(),
          ])
        : Container();
  }
}
