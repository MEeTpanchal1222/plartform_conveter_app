import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import '../screens/chat_screen/providers/chat_provider.dart';
import '../screens/person_add_tab/providers/person_add_provider.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveListTile extends StatelessWidget {
  const AdaptiveListTile(
      {super.key, required this.index, this.isForChat = true});
  final int index;
  final bool isForChat;
  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    final providerFalse = Provider.of<ChatProvider>(context, listen: false);
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            child: ListTile(
              onLongPress: () {
                providerFalse.bottomSheet(
                    context, providerTrue, providerFalse, index);
                Provider.of<PersonAddProvider>(context).clearController();
              },
              title: Text(providerTrue.personData[index].name.toString()),
              subtitle: isForChat
                  ? Text(providerTrue.personData[index].chatConversation
                      .toString())
                  : Text(providerTrue.personData[index].phoneNumber.toString()),
              leading: CircleAvatar(
                radius: 35,
                child: Provider.of<ChatProvider>(
                          context,
                        ).personData[index].imgPath ==
                        null
                    ? Icon(Icons.add_a_photo_outlined)
                    : null,
                backgroundImage: Provider.of<ChatProvider>(
                          context,
                        ).personData[index].imgPath !=
                        null
                    ? FileImage(Provider.of<ChatProvider>(
                        context,
                      ).personData[index].imgPath!)
                    : null,
              ),
              onTap: () {},
              trailing: isForChat
                  ? Text(
                      "${providerTrue.personData[index].date!.day.toString() + "-" + providerTrue.personData[index].date!.month.toString() + "-" + providerTrue.personData[index].date!.year.toString()}, ${providerTrue.personData[index].timeOfDay!.hour.toString() + ":" + providerTrue.personData[index].timeOfDay!.minute.toString()}")
                  : IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(
                            'tel: +91 ${providerTrue.personData[index].phoneNumber}');
                        url.launchUrl(uri);
                      },
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      )),
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onLongPress: () {
                providerFalse.cupertinosheet(
                    context, providerTrue, providerFalse, index);
                Provider.of<PersonAddProvider>(context).clearController();
              },
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: CupertinoListTile(
                  leadingSize: 50,
                  title: Text(providerTrue.personData[index].name.toString()),
                  subtitle: isForChat
                      ? Text(providerTrue.personData[index].chatConversation
                          .toString())
                      : Text(providerTrue.personData[index].phoneNumber
                          .toString()),
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Provider.of<ChatProvider>(
                                  context,
                                ).personData[index].imgPath ==
                                null
                            ? CupertinoColors.activeBlue
                            : null,
                        shape: BoxShape.circle,
                        image: Provider.of<ChatProvider>(
                                  context,
                                ).personData[index].imgPath !=
                                null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(Provider.of<ChatProvider>(
                                  context,
                                ).personData[index].imgPath!))
                            : null),
                    child: Provider.of<ChatProvider>(
                              context,
                            ).personData[index].imgPath ==
                            null
                        ? Icon(
                            CupertinoIcons.camera,
                            color: CupertinoColors.white,
                          )
                        : null,
                  ),
                  trailing: isForChat
                      ? Text(
                          "${providerTrue.personData[index].date!.day.toString() + "-" + providerTrue.personData[index].date!.month.toString() + "-" + providerTrue.personData[index].date!.year.toString()}, ${providerTrue.personData[index].timeOfDay!.hour.toString() + ":" + providerTrue.personData[index].timeOfDay!.minute.toString()}",
                          style: TextStyle(fontSize: 15),
                        )
                      : CupertinoButton(
                          child: Icon(
                            CupertinoIcons.phone,
                            color: CupertinoColors.activeGreen,
                          ),
                          onPressed: () {
                            Uri uri = Uri.parse(
                                'tel: +91 ${providerTrue.personData[index].phoneNumber}');
                            url.launchUrl(uri);
                          },
                        ),
                ),
              ),
            ),
          );
  }
}
