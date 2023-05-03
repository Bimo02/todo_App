import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(12)
        ),
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
                padding: const EdgeInsets.all(5.0),
                child: Text("Task1" , style: Theme.of(context).textTheme.headline3,),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Description" ,style: Theme.of(context).textTheme.headline4),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(CupertinoIcons.clock , color: Theme.of(context).hoverColor,),
                  ),
                  Text("10:30 AM")
                ],
              )
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7 , horizontal: 21),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(8)
            ),
            child: ImageIcon(AssetImage("assets/icons/Icon awesome-check.png"),color: Colors.white,size: 25),
          )
        ],
      ),
    );
  }
}
