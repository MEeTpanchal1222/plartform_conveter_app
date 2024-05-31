import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/settings_screen/providers/settings_provider.dart';
import '../utils/global provider/switch_provider.dart';

class ThemeModeScreen extends StatelessWidget {
  const ThemeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProviderfalse =
        Provider.of<ProfileProvider>(context, listen: false);
    final profileProvidertrue =
        Provider.of<ProfileProvider>(context, listen: true);

    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? ListTile(
            leading: Icon(Icons.sunny),
            title: Text('Theme'),
            subtitle: Text('Change Theme'),
            trailing: Switch(
              value: profileProvidertrue.isdark,
              onChanged: (value) {
                profileProviderfalse.changeColor(value);
                profileProviderfalse.setValues();
                profileProviderfalse.getValues();
              },
            ),
          )
        : CupertinoListTile(
            leading: const Icon(CupertinoIcons.sun_max),
            title: Text('Theme'),
            subtitle: Text('Change Theme'),
            trailing: CupertinoSwitch(
              value: profileProvidertrue.isdark,
              onChanged: (value) {
                profileProviderfalse.changeColor(value);
                profileProviderfalse.setValues();

                profileProviderfalse.getValues();
              },
            ));
  }
}
