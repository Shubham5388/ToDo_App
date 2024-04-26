import 'package:f2/db/database.dart';
import 'package:f2/utils/dialog_box.dart';
import 'package:f2/utils/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget{
const HomePage({super.key});

@override
State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
//refernce the hive box
final _myBox = Hive.box('mybox');
ToDoDataBase dbs = ToDoDataBase(); 

@override
  void initState() {
if (_myBox.get("TODOLIST")==null){
  dbs.createInitialData();
}
else{
  dbs.loadData();
}
    super.initState();
  }

final _controller = TextEditingController();

/*List toDoList = [
  ["Hiii",false],
  ["Biii",false]
];*/

void checkBoxChanged(bool? val , int index){
  setState(() {
    dbs.toDoList[index][1]=!dbs.toDoList[index][1];
  });
  dbs.updateDb();
}


void saveNewTask(){
  setState(() {
    dbs.toDoList.add([_controller.text,false]);
    _controller.clear();
  });
   Navigator.of(context).pop();
      dbs.updateDb();

}

void createNewTask(){
showDialog(context: context, builder: (context){
  return DialogBox(
    controller: _controller ,
    onSave: saveNewTask,
    onCancel: () => Navigator.of(context).pop(),
  );
},
);
}

void deleteTask(int index){
  setState(() {
    dbs.toDoList.removeAt(index);
  });
    dbs.updateDb();

}


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 216, 222, 182),
        title: Text("ToDo"),
        elevation: 0,
      ),

floatingActionButton: FloatingActionButton(onPressed: createNewTask,
child: Icon(Icons.add),),


      body: ListView.builder(
        itemCount: dbs.toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(taskName: dbs.toDoList[index][0],
           taskCompleted: dbs.toDoList[index][1], 
           onChanged: (val)=> checkBoxChanged(val,index),
           deleteFunction: (context) => deleteTask(index),
           );
           
        },
      ),
    );
  }
}