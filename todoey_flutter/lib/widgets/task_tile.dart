import 'package:flutter/material.dart';
class TaskTile extends StatelessWidget {
TaskTile({this.isChecked,
  this.tasktitle,
  this.checkboxCallback,
  this.longPressCallback});

  final bool isChecked ;
  final String tasktitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
        title: Text(
            tasktitle,
                style: TextStyle(
                    decoration:isChecked? TextDecoration.lineThrough:null
        ),
        ),
        trailing: Checkbox(
                value: isChecked,
                activeColor: Colors.lightBlueAccent,
                 onChanged:checkboxCallback,
        ),

    );
  }
}

