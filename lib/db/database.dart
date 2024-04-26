
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
List toDoList = [];


  final _myBox =Hive.box('mybox'); 


  void createInitialData(){
    toDoList=[
      ["hiii",false],
      ["biii",false],
    ];
  }
//load the data from db
void loadData(){
  toDoList = _myBox.get("TODOLIST");
}

void updateDb(){
  _myBox.put("TODOLIST", toDoList);
}

}