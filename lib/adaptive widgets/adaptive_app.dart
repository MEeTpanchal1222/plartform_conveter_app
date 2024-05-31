import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/settings_screen/providers/settings_provider.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key, required this.scaffold});

  final Widget scaffold;
  @override
  Widget build(BuildContext context) {
    final profileProvidertrue =
        Provider.of<ProfileProvider>(context, listen: true);
    return (!Provider.of<SwitchProvider>(context).isAndroid)
        ? CupertinoApp(
            theme: !profileProvidertrue.isdark
                ? CupertinoThemeData(brightness: Brightness.light)
                : CupertinoThemeData(
                    brightness: Brightness.dark,

                    // barBackgroundColor: CupertinoColors.black,
                    textTheme: CupertinoTextThemeData(
                        textStyle: TextStyle(color: CupertinoColors.white))),
            home: scaffold,
            debugShowCheckedModeBanner: false,
          )
        : MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark().copyWith(
              cardColor: Colors.black38,
              textTheme: TextTheme(
                  bodySmall: TextStyle(color: Colors.white),
                  bodyLarge: TextStyle(
                    color: Colors.white,
                    // fontSize: 25,
                  )),
            ),
            themeMode:
                !profileProvidertrue.isdark ? ThemeMode.light : ThemeMode.dark,
            home: scaffold,
            debugShowCheckedModeBanner: false,
          );
  }
}
