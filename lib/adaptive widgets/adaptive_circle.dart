import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/chat_screen/providers/chat_provider.dart';
import '../screens/person_add_tab/providers/person_add_provider.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveCircleAvatar extends StatelessWidget {
  AdaptiveCircleAvatar(
      {super.key,
      this.radius = 60,
      this.height = 110,
      this.width = 110,
      this.isForChatAndCall = false,
      this.index = 0});
  double? radius, height, width;
  final bool isForChatAndCall;
  int index;

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? InkWell(
            radius: radius,
            onTap: () {
              Provider.of<PersonAddProvider>(context, listen: false)
                  .pickImage();
            },
            child: CircleAvatar(
                radius: radius,
                child: Provider.of<PersonAddProvider>(context).imgpath == null
                    ? Icon(Icons.add_a_photo_outlined)
                    : null,
                backgroundImage: !isForChatAndCall
                    ? Provider.of<PersonAddProvider>(context).imgpath == null
                        ? null
                        : FileImage(
                            Provider.of<PersonAddProvider>(context).imgpath!)
                    : Provider.of<ChatProvider>(
                              context,
                            ).personData[index].imgPath !=
                            null
                        ? FileImage(Provider.of<ChatProvider>(
                            context,
                          ).personData[index].imgPath!)
                        : null),
          )
        : CupertinoButton(
            onPressed: () {
              Provider.of<PersonAddProvider>(context, listen: false)
                  .pickImage();
            },
            child: ClipOval(
              child: Container(
                height: height,
                width: width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    image:
                        Provider.of<PersonAddProvider>(context).imgpath != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                    Provider.of<PersonAddProvider>(context)
                                        .imgpath!))
                            : null),
                child: Provider.of<PersonAddProvider>(context).imgpath == null
                    ? Icon(
                        CupertinoIcons.camera,
                        color: CupertinoColors.white,
                      )
                    : null,
              ),
            ),
          );
  }
}
