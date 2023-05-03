import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(12.0),
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add New Task" , style: Theme.of(context).textTheme.subtitle1,)
              ],
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter Task Title' ,labelStyle: Theme.of(context).textTheme.subtitle2
                    ),
                  ),
                  TextFormField(
                    maxLines: 4,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        labelText: 'Enter Task Description' ,labelStyle: Theme.of(context).textTheme.subtitle2
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Select Date' , style: Theme.of(context).textTheme.subtitle1),
                  ),
                  Text('2/05/2023' , style: Theme.of(context).textTheme.subtitle1 , textAlign: TextAlign.center,),
                ],
              ),
            ),
            FloatingActionButton(onPressed: (){} , child: Icon(Icons.check),),
          ],
        ),
    );
  }
}
