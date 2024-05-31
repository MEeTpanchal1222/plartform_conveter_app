import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plartform_conveter_app/screens/chat_screen/providers/chat_provider.dart';

import 'package:provider/provider.dart';

import '../../adaptive widgets/adaptive_ListTile.dart';


class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ...List.generate(
              providerTrue.personData.length,
              (index) => AdaptiveListTile(
                    index: index,
                  ))
        ],
      ),
    );
  }
}

// AdaptiveCircleAvatar(
// radius: 35,
// height: 30,
// width: 30,
// ),
