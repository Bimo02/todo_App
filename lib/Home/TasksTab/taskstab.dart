import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:islamiapp/Home/TasksTab/taskwidget.dart';

class TasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.18,
          child: Column(
            children: [
              Stack(children: [
                Column(
                  children: [
                    Container(
                      color: Theme.of(context).primaryColorLight,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Container(
                      color: Theme.of(context).primaryColor,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CalendarTimeline(
                      initialDate: DateTime(2020,5 ,02),
                      firstDate: DateTime(2019, 1, 15),
                      lastDate: DateTime(2020, 11, 20),
                      onDateSelected: (date) => print(date),
                      leftMargin: 10,
                      monthColor: Colors.black,
                      dayColor: Colors.black,
                      activeDayColor: Theme.of(context).primaryColorLight,
                      activeBackgroundDayColor: Theme.of(context).highlightColor,
                      dotsColor: Color(0xFF333A47),
                      selectableDayPredicate: (date) => date.day != 20,
                      locale: 'en_ISO',
                    )
                  ],
                )
              ]),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context , index) {
            return TaskWidget();
          },
            itemCount: 5,),
        )
      ],
    );
  }
}
