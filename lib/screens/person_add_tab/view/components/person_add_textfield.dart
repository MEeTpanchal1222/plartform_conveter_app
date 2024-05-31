import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../adaptive widgets/adaptive_textfield.dart';
import '../../../../utils/global provider/switch_provider.dart';
import '../person_add_screen.dart';

class TextFieldPersonAdd extends StatelessWidget {
  const TextFieldPersonAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdaptiveTextField(
          controller: txtFullName!,
          hintText: "Full Name",
          icon: (Provider.of<SwitchProvider>(context).isAndroid)
              ? Icon(Icons.person)
              : Icon(CupertinoIcons.person),
        ),
        AdaptiveTextField(
          controller: txtPhoneNumber!,
          hintText: "Phone Number",
          icon: (Provider.of<SwitchProvider>(context).isAndroid)
              ? Icon(Icons.phone)
              : Icon(CupertinoIcons.phone),
        ),
        AdaptiveTextField(
          controller: txtChatConversation!,
          hintText: "Chat Conversation",
          icon: (Provider.of<SwitchProvider>(context).isAndroid)
              ? Icon(Icons.chat)
              : Icon(CupertinoIcons.chat_bubble_text_fill),
        ),
      ],
    );
  }
}
