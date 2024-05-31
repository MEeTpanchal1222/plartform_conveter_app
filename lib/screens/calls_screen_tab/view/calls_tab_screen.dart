import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../adaptive widgets/adaptive_ListTile.dart';
import '../../chat_screen/providers/chat_provider.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);

    return Column(
      children: [
        ...List.generate(
            providerTrue.personData.length,
            (index) => AdaptiveListTile(
                  index: index,
                  isForChat: false,
                ))
      ],
    );
  }
}
