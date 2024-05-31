import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/person_add_tab/providers/person_add_provider.dart';
import '../utils/global provider/switch_provider.dart';

class AdaptiveDateTime extends StatelessWidget {
  const AdaptiveDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<PersonAddProvider>(context, listen: true);
    final providerFalse =
        Provider.of<PersonAddProvider>(context, listen: false);
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Column(
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  TextButton(
                      onPressed: () async {
                        providerFalse.setDate(await showDatePicker(
                                context: context,
                                firstDate: DateTime(1924),
                                lastDate: DateTime(2025)) ??
                            DateTime.now());
                      },
                      child: Text(
                        providerTrue.dateTime == null
                            ? "Pick Date"
                            : "${providerTrue.dateTime!.day.toString() + "-" + providerTrue.dateTime!.month.toString() + "-" + providerTrue.dateTime!.year.toString()}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ))
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time),
                  TextButton(
                      onPressed: () async {
                        providerFalse.setTime(
                            timeOfDay: await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()) ??
                                TimeOfDay.now());
                      },
                      child: Text(
                        providerTrue.timeOfDay == null
                            ? "Pick Time"
                            : "${providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString()}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ))
                ],
              ),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.calendar),
                  SizedBox(
                    width: 15,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                        providerTrue.dateTime == null
                            ? "Pick Date"
                            : "${providerTrue.dateTime!.day.toString() + "-" + providerTrue.dateTime!.month.toString() + "-" + providerTrue.dateTime!.year.toString()}",
                        style: CupertinoTheme.of(context).textTheme.textStyle),
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (value) {
                              providerFalse.setDate(value);
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.time),
                  SizedBox(
                    width: 15,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      providerTrue.timeOfDay == null
                          ? "Pick Time"
                          : "${providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString()}",
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                    ),
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor,
                          child: CupertinoTimerPicker(
                            onTimerDurationChanged: (value) {
                              providerFalse.setTime(duration: value);
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          );
  }
}
