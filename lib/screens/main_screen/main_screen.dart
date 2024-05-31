import 'package:flutter/cupertino.dart';
import '../../adaptive widgets/adaptive_app.dart';
import '../../adaptive widgets/adaptive_scaffold.dart';
import '../../adaptive widgets/adaptive_tab_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveApp(scaffold: AdaptiveScaffold(body: AdaptiveTabBar()));
  }
}
