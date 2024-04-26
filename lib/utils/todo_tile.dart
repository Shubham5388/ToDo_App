import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   ToDoTile({super.key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction});
  
 

  @override
  Widget build(BuildContext context) {
    return Padding( 
    padding:  EdgeInsets.all(25.0),
    child: Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
      
      children: [SlidableAction(onPressed: deleteFunction,
      icon: Icons.delete ,
      backgroundColor: Colors.red.shade300,
      )],

      ),
    
    child: Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 189, 160, 194),
      borderRadius: BorderRadius.circular(10)),
      child: Row(
      children: [
    //checkbox
Checkbox(value: taskCompleted, onChanged: onChanged
,activeColor: Color.fromARGB(255, 128, 97, 3),),

Text(taskName,
style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),
],
      ),
    ),
    ),
    );
  }
}