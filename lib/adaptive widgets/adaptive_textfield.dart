import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/global provider/switch_provider.dart';

class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon});

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: icon,
                  hintText: hintText,
                  labelText: hintText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1))),
            ),
          )
        : Row(
            children: [
              icon,
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  child: CupertinoTextField(
                    placeholder: hintText,
                    controller: controller,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: CupertinoColors.systemGrey, width: 1)),
                  ),
                ),
              ),
            ],
          );
  }
}
