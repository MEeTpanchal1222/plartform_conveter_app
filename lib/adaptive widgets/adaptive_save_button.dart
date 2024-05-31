import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/chat_screen/providers/chat_provider.dart';
import '../screens/person_add_tab/providers/person_add_provider.dart';
import '../screens/person_add_tab/view/person_add_screen.dart';
import '../utils/global provider/person_data_model.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveSaveButton extends StatelessWidget {
  const AdaptiveSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? OutlinedButton(
            onPressed: () {
              Provider.of<ChatProvider>(context, listen: false).addData(
                  PersonDataModel(
                      imgPath:
                          Provider.of<PersonAddProvider>(context, listen: false)
                                  .imgpath ??
                              null,
                      chatConversation: txtChatConversation?.text ?? "",
                      name: txtFullName != null ? txtFullName!.text : "",
                      phoneNumber:
                          txtPhoneNumber != null ? txtPhoneNumber!.text : "",
                      date: Provider.of<PersonAddProvider>(context,
                                  listen: false)
                              .dateTime ??
                          DateTime.now(),
                      timeOfDay:
                          Provider.of<PersonAddProvider>(context, listen: false)
                                  .timeOfDay ??
                              TimeOfDay.now()));
              Provider.of<PersonAddProvider>(context, listen: false).imgpath =
                  null;
              Provider.of<PersonAddProvider>(context, listen: false)
                  .clearController();
            },
            child: Text("Save"))
        : CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
                height: 45,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Save",
                  style: TextStyle(color: CupertinoColors.white),
                )),
            onPressed: () {
              Provider.of<ChatProvider>(context, listen: false).addData(
                  PersonDataModel(
                      imgPath:
                          Provider.of<
                                      PersonAddProvider>(context, listen: false)
                                  .imgpath ??
                              null,
                      chatConversation:
                          txtChatConversation !=
                                  null
                              ? txtChatConversation!.text
                              : "",
                      name: txtFullName != null ? txtFullName!.text : "",
                      phoneNumber:
                          txtPhoneNumber != null ? txtPhoneNumber!.text : "",
                      date: Provider.of<PersonAddProvider>(context,
                                  listen: false)
                              .dateTime ??
                          DateTime.now(),
                      timeOfDay:
                          Provider.of<PersonAddProvider>(context, listen: false)
                                  .timeOfDay ??
                              TimeOfDay.now()));
              Provider.of<PersonAddProvider>(context, listen: false).imgpath =
                  null;

              Provider.of<PersonAddProvider>(context, listen: false)
                  .clearController();
            },
          );
  }
}
