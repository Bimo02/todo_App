import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:islamiapp/Home/TasksTab/taskwidget.dart';
import 'package:islamiapp/firebase_utils.dart';
import 'package:provider/provider.dart';

import '../../model/task.dart';
import '../../providers/app_config_provider.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if(provider.taskList.isEmpty)
      {
        provider.getALlTasksFromFireStore();
      }
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.17,
          child: Column(
            children: [
              Stack(children: [
                Column(
                  children: [
                    Container(
                      color: Theme.of(context).primaryColorLight,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    Container(
                      color: Theme.of(context).primaryColor,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CalendarTimeline(
                        selectedMonthTextStyle:
                            Theme.of(context).textTheme.headline6!,
                        unselcetedMonthStyle:
                            Theme.of(context).textTheme.headline4!,
                        selectedTextStyle:
                            Theme.of(context).textTheme.headline5!,
                        unselcetedText: Theme.of(context).textTheme.headline4!,
                        initialDate: provider.selectedDate,
                        firstDate: DateTime.now().subtract(Duration(days: 365)),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        onDateSelected: (date) {
                          provider.setNewSelectedDate(date);
                        },
                        leftMargin: 10,
                        monthColor: Colors.black,
                        dayColor: Colors.black,
                        activeDayColor: Theme.of(context).primaryColorLight,
                        activeBackgroundDayColor:
                            Theme.of(context).highlightColor,
                        dotsColor: Theme.of(context).primaryColorLight,
                        selectableDayPredicate: (date) => true,
                        locale: 'en_ISO',
                      )
                    ],
                  ),
                )
              ]),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(2),
                child: TaskWidget(
                  task: provider.taskList[index],
                ),
              );
            },
            itemCount: provider.taskList.length,
          ),
        )
      ],
    );
  }
}

