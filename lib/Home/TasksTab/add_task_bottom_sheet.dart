import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamiapp/firebase_utils.dart';
import 'package:provider/provider.dart';

import '../../model/task.dart';
import '../../providers/app_config_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';

  String description = '';

  DateTime selectedDay = DateTime.now();
  late AppConfigProvider provider;
  late String formattedDate;
  GlobalKey<FormState> formKey= GlobalKey<FormState> ();
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
     formattedDate = DateFormat.yMEd().format(selectedDay);
    return Container(
      color: Theme.of(context).highlightColor,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add New Task",
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter Task Title',
                        labelStyle: Theme.of(context).textTheme.subtitle2),
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text){
                      if(text==null || text=='')
                        {
                          return 'Please Enter Task Title';
                        }
                      return null;
                    } ,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      description = text;
                    },
                    scrollController: ScrollController(keepScrollOffset: true),
                    maxLines: 4,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        labelText: 'Enter Task Description',
                        labelStyle: Theme.of(context).textTheme.subtitle2),
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
    );
  }

  void chooseDay() async{
    var  choosenDay = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(choosenDay!=null)
      {
        selectedDay=choosenDay;
        setState(() {

        });
        print(selectedDay);
      }

  }
  void addTask() {
    if(formKey.currentState?.validate()==true)
    {
      Task task = Task(date: selectedDay.millisecondsSinceEpoch, title: title, description: description);
      addTaskToFireStore(task).timeout(Duration(microseconds: 500), onTimeout: (){
        Navigator.pop(context);
        provider.getALlTasksFromFireStore();
        print('task added');
      });
    }
  }

}
