import 'package:f2/utils/my_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget 
{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
   DialogBox({super.key,required this.controller,
   required this.onSave,
   required this.onCancel
   });

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: Container(height: 120,
      child: Column(children: [
        TextField(
          controller: controller ,
          decoration: InputDecoration(border: OutlineInputBorder(),
        hintText: "Add a new Task"  ),
        ),


       Row(
        children: [
    MyButton(text: "SAVE", onPressed: onSave),
    MyButton(text: "CANCEL", onPressed: onCancel)

        ],
       ),

      ],),),
    );
  }
}