import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../adaptive widgets/adaptive_circle.dart';
import '../../../adaptive widgets/adaptive_date_time.dart';
import '../../../adaptive widgets/adaptive_save_button.dart';
import 'components/person_add_textfield.dart';

TextEditingController? txtFullName = TextEditingController();
TextEditingController? txtPhoneNumber = TextEditingController();
TextEditingController? txtChatConversation = TextEditingController();

class PersonAddTab extends StatelessWidget {
  const PersonAddTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AdaptiveCircleAvatar(),
            SizedBox(
              height: 30,
            ),
            TextFieldPersonAdd(),
            AdaptiveDateTime(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [AdaptiveSaveButton()],
            )
          ],
        ),
      ),
    );
  }
}
