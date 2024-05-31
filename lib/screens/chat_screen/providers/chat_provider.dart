import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/global provider/person_data_model.dart';
import '../../person_add_tab/providers/person_add_provider.dart';
import '../../person_add_tab/view/components/person_add_textfield.dart';
import '../../person_add_tab/view/person_add_screen.dart';

class ChatProvider extends ChangeNotifier {
  List<PersonDataModel> personData = [];

  void addData(PersonDataModel data) {
    personData.add(data);
    notifyListeners();
  }

  Future<void> deleteData(int index) async {
    if (index >= 0 && index < personData.length) {
      await Future.delayed(Duration(milliseconds: 200)); // Addi
      personData.removeAt(index);
    }
    notifyListeners();
  }

  void updateData(int index, PersonDataModel updatedData) {
    personData[index] = updatedData;
    notifyListeners();
  }

  void updateControllerForEditing(String name, String phone, String chat) {
    txtFullName!.text = name;
    txtPhoneNumber!.text = phone;
    txtChatConversation!.text = chat;
  }

  Future<dynamic> bottomSheet(BuildContext context, ChatProvider providerTrue,
      ChatProvider providerFalse, int index) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        alignment: Alignment.center,
        width: double.infinity,
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 50,
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
            Text(
              providerTrue.personData[index].name.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(
              providerTrue.personData[index].chatConversation.toString(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      providerFalse.updateControllerForEditing(
                          providerFalse.personData[index].name!,
                          providerFalse.personData[index].phoneNumber!,
                          providerFalse.personData[index].chatConversation!);
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Edit Details"),
                          content: Container(
                            height: 270,
                            width: 400,
                            child: Column(
                              children: [TextFieldPersonAdd()],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  providerFalse.updateData(
                                      index,
                                      PersonDataModel(
                                          name: txtFullName?.text ?? "",
                                          phoneNumber:
                                              txtPhoneNumber?.text ?? "",
                                          chatConversation:
                                              txtChatConversation?.text ?? "",
                                          timeOfDay: providerFalse
                                              .personData[index].timeOfDay,
                                          date: providerFalse
                                              .personData[index].date,
                                          imgPath: providerFalse
                                              .personData[index].imgPath));
                                  Provider.of<PersonAddProvider>(context,
                                          listen: false)
                                      .clearController();
                                  Navigator.pop(context);
                                },
                                child: Text("Save")),
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      providerFalse.deleteData(index);
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"))
          ],
        ),
      ),
    );
  }

  void cupertinosheet(BuildContext context, ChatProvider providerTrue,
      ChatProvider providerFalse, int index) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 300,
        alignment: Alignment.center,
        width: double.infinity,
        color: CupertinoTheme.of(context).primaryContrastingColor,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 50,
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
            Text(
              providerTrue.personData[index].name.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(
              providerTrue.personData[index].chatConversation.toString(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    onPressed: () {
                      providerFalse.updateControllerForEditing(
                          providerFalse.personData[index].name!,
                          providerFalse.personData[index].phoneNumber!,
                          providerFalse.personData[index].chatConversation!);
                      Navigator.pop(context);
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text("Edit Details"),
                          content: Container(
                            height: 270,
                            width: 400,
                            child: Column(
                              children: [TextFieldPersonAdd()],
                            ),
                          ),
                          actions: [
                            CupertinoButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel")),
                            CupertinoButton(
                                onPressed: () {
                                  providerFalse.updateData(
                                      index,
                                      PersonDataModel(
                                          name: txtFullName?.text ?? "",
                                          phoneNumber:
                                              txtPhoneNumber?.text ?? "",
                                          chatConversation:
                                              txtChatConversation?.text ?? "",
                                          timeOfDay: providerFalse
                                              .personData[index].timeOfDay,
                                          date: providerFalse
                                              .personData[index].date,
                                          imgPath: providerFalse
                                              .personData[index].imgPath));
                                  Provider.of<PersonAddProvider>(context,
                                          listen: false)
                                      .clearController();
                                  Navigator.pop(context);
                                },
                                child: Text("Save")),
                          ],
                        ),
                      );
                      Provider.of<PersonAddProvider>(context).clearController();
                    },
                    child: Icon(Icons.edit)),
                CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                      providerFalse.deleteData(index);
                    },
                    child: Icon(Icons.delete))
              ],
            ),
            CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"))
          ],
        ),
      ),
    );
  }
}
