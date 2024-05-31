import 'package:flutter/material.dart';

import '../../../utils/global provider/switch_provider.dart';

AppBar appBar(SwitchProvider providerTrue, SwitchProvider providerFalse) {
  return AppBar(
    title: const Text("Platform Convertor"),
    // toolbarHeight: 50,
    actions: [
      Switch(
        value: providerTrue.isAndroid,
        onChanged: (value) {
          providerFalse.changePlatform(value);
        },
      )
    ],
    bottom: const TabBar(tabs: [
      Tab(
        icon: Icon(Icons.person_add),
      ),
      Tab(
        text: "Chat",
      ),
      Tab(
        text: "Calls",
      ),
      Tab(
        text: "Settings",
      ),
    ]),
  );
}
