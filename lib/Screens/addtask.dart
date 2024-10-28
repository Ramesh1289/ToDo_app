//import 'dart:js_interop';
//import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:todo_app/Screens/mytodo.dart';
import 'package:todo_app/Screens/profile.dart';
import 'package:todo_app/service/databaseservice.dart';
import 'package:todo_app/models/task.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
final DatabaseHelper _dbHelper=DatabaseHelper();
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _desController=TextEditingController();
  final TextEditingController _dateController=TextEditingController();
  String _priority='High';
  List<Task> _taskList=[];
  @override
  void initState(){
    super.initState();
    _loadTasks();
  }
  Future<void>_loadTasks() async{
    final tasks=await _dbHelper.tasks();
    print("Tasks fetched from DB:${tasks.length}");
    setState(() {
      _taskList=tasks;
    });
  }

  Future<void> _addTask()async{
    final title=_titleController.text;
    final description=_desController.text;
    final date=_dateController.text;
    final priority=_priority;
    if(title.isNotEmpty && description.isNotEmpty && date.isNotEmpty && priority.isNotEmpty){
      await _dbHelper.insertTask(
          Task(title: title,
              description: description,
              date: date,
              priority: priority));
      _titleController.clear();
      _desController.clear();
      _dateController.clear();
      _loadTasks();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task Added successfully!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFFF6EEE2),
        centerTitle: true,
        title: Image.asset('assets/images/add_tsk.png',
          fit:BoxFit.cover,
          height: 20,),
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Mytodo()),);
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,

            ),
            child: const Icon(Icons.arrow_back,
              color: Color(0xFF6C1D45),
            ),
          )
          ,
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile(),));

              },
             child: const CircleAvatar(
               backgroundImage: AssetImage('assets/images/profile avatar.png',),
               radius: 22,
             ),
          ),

        ],
                ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Title',
              style: TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                  border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(0),
            borderSide: const BorderSide(
              color: Color(0xFF6C1D45),
              width:3,
            ),
                            ),
                fillColor:Colors.white.withOpacity(0.2),
                filled: true),
                                       ),
                      const SizedBox(height: 15),

            const Text('Description',
              style:TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
            ),
            TextField(
              controller: _desController,
              maxLines: 3,
              decoration: InputDecoration(
                                    border:OutlineInputBorder(
                        borderRadius:BorderRadius.circular(0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF6C1D45),
                                        width:3,
                                      ),
              ),
                fillColor:Colors.white.withOpacity(0.1),
                filled: true,
              ),
            ),
            const SizedBox(height: 15),
            const Text('Date',
              style:TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(0),
                  borderSide: const BorderSide(
                    color: Color(0xFF6C1D45),
                    width:3,
                  ),
                ),
                fillColor:Colors.white.withOpacity(0.1),
                filled: true,
              ),
            ),
            const SizedBox(height: 15),
            const Text('Priority',
              style:TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
            ),
DropdownButtonFormField<String>(

  value: _priority,
  items: ['High','Medium','Low'].map((priority)=>DropdownMenuItem(value: priority,
  child: Text(priority,
    style: const TextStyle(color: Color(0xFF6C1D45),
  ),
  ),
  )).toList(),onChanged: (value){
    setState(() {
      _priority=value!;
    });
  },
  decoration: InputDecoration(
      border:OutlineInputBorder(
      borderRadius:BorderRadius.circular(0),
        borderSide: const BorderSide(
          color: Color(0xFF6C1D45),
          width:3,
        ),
),
        fillColor:Colors.white.withOpacity(0.1),
        filled: true,),
),

            const SizedBox(height: 20),
                 Center(
              child:ElevatedButton(onPressed:_addTask,
            style: ElevatedButton.styleFrom(
              shape:const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 140),
              backgroundColor: const Color(0xFF6C1D45),),
              child:const Text('Add Task',
                style: TextStyle(fontSize: 16,color: Colors.white),

              ),
            ),
            ),

],
        ),


        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF6C1D45),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            IconButton(
              icon: const Icon(Icons.favorite_outline_rounded),
              onPressed:(){},
              color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.bookmark_outline_rounded,
              size: 24,
              color: Colors.white,

            ),
            onPressed:(){

            },
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.settings_outlined,
                color: Colors.white,
                size: 24,
              ),
              onPressed:(){},

            ),
            IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile(),));
              },
              color: Colors.white,
            ),
          ],
        ),

      ),
      );



  }
}
