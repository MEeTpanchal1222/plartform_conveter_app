import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/settings_screen/providers/settings_provider.dart';
import '../utils/global provider/switch_provider.dart';

class ProfileAdaptive extends StatelessWidget {
  const ProfileAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProviderfalse =
        Provider.of<ProfileProvider>(context, listen: false);
    final profileProvidertrue =
        Provider.of<ProfileProvider>(context, listen: true);

    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Column(
            children: [
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Profile'),
                subtitle: Text('Update Profile Data'),
                trailing: Switch(
                  value: profileProvidertrue.isProfile,
                  onChanged: (value) {
                    profileProviderfalse.profileshow(value);
                  },
                ),
              ),
              (profileProvidertrue.isProfile)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                profileProviderfalse.profileImage();
                              },
                              child: (profileProvidertrue.profileImgPath !=
                                      null)
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage: FileImage(
                                          profileProvidertrue.profileImgPath!))
                                  : CircleAvatar(
                                      radius: 60,
                                      child: Icon(Icons.add_a_photo_outlined),
                                    ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: profileProvidertrue.txtfullname,
                              decoration: InputDecoration(
                                  hintText: 'Enter your Name...'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                controller: profileProvidertrue.txtbio,
                                decoration: InputDecoration(
                                    hintText: 'Enter your Bio..')),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Save')),
                                ElevatedButton(
                                    onPressed: () {
                                      profileProviderfalse.clearprofile();
                                    },
                                    child: Text('Clear')),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          )
        : Column(
            children: [
              CupertinoListTile(
                leading: Icon(CupertinoIcons.person),
                title: Text('Profile'),
                subtitle: Text('Update Profile Data'),
                trailing: CupertinoSwitch(
                  value: profileProvidertrue.isProfile,
                  onChanged: (value) {
                    profileProviderfalse.profileshow(value);
                  },
                ),
              ),
              (profileProvidertrue.isProfile)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                profileProviderfalse.profileImage();
                              },
                              child: (profileProvidertrue.profileImgPath !=
                                      null)
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage: FileImage(
                                          profileProvidertrue.profileImgPath!))
                                  : CircleAvatar(
                                      radius: 60,
                                      backgroundColor:
                                          CupertinoColors.activeGreen,
                                      child: Icon(
                                        CupertinoIcons.photo_camera,
                                        color: CupertinoColors.white,
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CupertinoTextField(
                              controller: profileProvidertrue.txtfullname,
                              padding: EdgeInsets.all(10),
                              placeholder: 'Enter Your Name..',
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CupertinoTextField(
                              controller: profileProvidertrue.txtbio,
                              padding: EdgeInsets.all(10),
                              placeholder: 'Enter Your Bio..',
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CupertinoButton(
                                  child: Text('Save'),
                                  onPressed: () {},
                                ),
                                CupertinoButton(
                                  child: Text('Clear'),
                                  onPressed: () {},
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
  }
}
