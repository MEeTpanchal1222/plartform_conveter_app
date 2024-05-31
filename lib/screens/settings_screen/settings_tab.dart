import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../adaptive widgets/adaptive_settings_profile.dart';
import '../../adaptive widgets/adaptive_theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Column(
          children: [
            ProfileAdaptive(),
            ThemeModeScreen(),
          ],
        ),
      ),
    );
  }
}
