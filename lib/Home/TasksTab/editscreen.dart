import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:islamiapp/Home/TasksTab/add_task_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../firebase_utils.dart';
import '../../model/task.dart';
import '../../providers/app_config_provider.dart';

class EditScreen extends StatefulWidget {
  static const String routeName = 'Edit Screen';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String title = '';
  DateTime selectedDate=DateTime.now();
  String description = '';
  late AppConfigProvider provider;
  late TaskTabArgs args;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddTaskBottomSheet? addTaskBottomSheet;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as TaskTabArgs;
    provider = Provider.of<AppConfigProvider>(context);
    var dt=DateTime.fromMillisecondsSinceEpoch(args.task.date);
    String formattedDate = DateFormat.yMEd().format(dt);
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.headline1),
        ),
        body: ListView(
          children: [Column(
              children: [
            Stack(
                alignment: Alignment.topCenter, children: [
              Container(
                color: Theme.of(context).hoverColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                margin: EdgeInsets.all(35),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Edit Task",
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: args.task.title,
                                labelStyle:
                                    Theme.of(context).textTheme.subtitle2),
                            onChanged: (text) {
                              title = text;
                            },
                            validator: (text) {
                              if (text == null || text == '') {
                                return 'Please Edit Task Title';
                              }
                              return null;
                            },
                          ),
                          TextFormField(

                            onChanged: (text) {
                              description = text;
                            },
                            maxLines: 4,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                labelText: args.task.description,
                                labelStyle:
                                    Theme.of(context).textTheme.subtitle2),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Select Date',
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          InkWell(
                              onTap: () {
                                chooseDay();
                              },
                              child: Text(
                                formattedDate,
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Icon(Icons.check),
                    ),
                  ],
                ),
              ),
            ]),
          ])],
        ));
  }

  void chooseDay() async {
    var choosenDay = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choosenDay != null) {
      selectedDate = choosenDay;
      setState(() {});
      print(selectedDate);
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      getTaskCollection().doc(args.task.id).update({'title' : title,
        'description' : description,
        'dateTime' : selectedDate.millisecondsSinceEpoch});
      provider.getALlTasksFromFireStore();
      Navigator.pop(context);
      print('task added');
    }
  }
}
class TaskTabArgs{
  Task task;
  TaskTabArgs({required this.task , });
}
