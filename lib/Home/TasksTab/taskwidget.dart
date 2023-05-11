import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/Home/TasksTab/editscreen.dart';
import 'package:islamiapp/Theme%20Data/my_theme.dart';
import 'package:islamiapp/firebase_utils.dart';
import 'package:provider/provider.dart';

import '../../model/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../providers/app_config_provider.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  TaskWidget({required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Slidable(
      startActionPane:
          ActionPane(motion:  ScrollMotion(), extentRatio:0.2, children: [
        SlidableAction(
          flex: 1,
          padding: EdgeInsets.all(12),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
          onPressed: (context) {
            deleteTaskFromFireStore(widget.task).timeout(Duration(microseconds: 500), onTimeout: (){
              print("task was deleted");
            });
            provider.getALlTasksFromFireStore();
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      endActionPane: ActionPane(
        closeThreshold: 0.5,
        motion: ScrollMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            padding: EdgeInsets.all(8),
            // An action can be bigger than the others.
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
            flex: 2,
            onPressed: (context) {
              Navigator.pushNamed(context, EditScreen.routeName,arguments: TaskTabArgs(task: widget.task));
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              color: Theme.of(context).primaryColorLight,
              height: 80,
              width: 5,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 17),
                      child: Text(
                        widget.task.title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 17),
                      child: Text(widget.task.description,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ],
                )),
            widget.task.isChecked?
            Container(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 21),
              child: Text("Done!" , style: GoogleFonts.poppins(color: MyThemeData.textsec , fontSize: 22, fontWeight: FontWeight.bold),),
            ): InkWell(
              onTap: (){
                return taskdone();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 21),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(8)),
                child: ImageIcon(
                    AssetImage("assets/icons/Icon awesome-check.png"),
                    color: Colors.white,
                    size: 25),
              ),
            )
          ],
        ),
      ),
    );
  }

  void taskdone() {
    getTaskCollection().doc(widget.task.id).update({'isChecked': true});
    print("task done");
    provider.getALlTasksFromFireStore();
    setState(() {

    });
  }
}
