import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/main_screen/components/material_appBar.dart';
import '../screens/models/screen_models.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveScaffold extends StatelessWidget {
  AdaptiveScaffold({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<SwitchProvider>(context);
    final providerFalse = Provider.of<SwitchProvider>(context, listen: false);
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? DefaultTabController(
            length: 4,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: body,
              appBar: appBar(providerTrue, providerFalse),
            ),
          )
        : CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add)),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                  label: "Chats"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone), label: "Calls"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: "Settings"),
            ]),
            tabBuilder: (context, index) => CupertinoPageScaffold(
              resizeToAvoidBottomInset: true,
              child: screenList[index].screen,
              navigationBar: CupertinoNavigationBar(
                border: null,
                backgroundColor: CupertinoColors.systemGrey6,
                middle: Text("Platform Convertor"),
                trailing: CupertinoSwitch(
                  onChanged: (value) {
                    providerFalse.changePlatform(value);
                  },
                  value: providerTrue.isAndroid,
                ),
              ),
            ),
          );
  }
}
