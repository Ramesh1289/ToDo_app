import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Screens/addtask.dart';
import 'package:todo_app/Screens/tasklist.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/Screens/profile.dart';
import 'package:todo_app/service/databaseservice.dart';
import 'package:todo_app/Screens/myprofile.dart';

class Mytodo extends StatefulWidget {
 @override
  State<Mytodo> createState() => _MytodoState();
}

class _MytodoState extends State<Mytodo> {
List<Task> _taskList=[];
final DatabaseHelper _dbHelper=DatabaseHelper();
@override
 void initState(){
  super.initState();
  _loadTasks();
  }
  Future<void> _loadTasks() async{
final tasks=await _dbHelper.tasks();
setState(() {
  _taskList=tasks;
});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme:ThemeData(scaffoldBackgroundColor:Colors.white),
    home: Scaffold(
    appBar: AppBar(
      leading: IconButton(
          icon:Image.asset('assets/icons/grid.png',
          width: 24,
          height: 24,),

        onPressed: (){},
      ),
      actions: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile(),));

          },
          child:const  CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile avatar.png',),
            radius: 24,
          ),
        ),
      ],
      backgroundColor:const Color(0xFFF6EEE2),
    centerTitle: true,
    title: Image.asset('assets/images/logo.png',
    fit:BoxFit.cover,
    height: 20,),
    ),

      body:_taskList.isEmpty?
      Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
        
            height: MediaQuery.of(context).size.height-50,
            width: double.infinity,
        
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
        
                SizedBox(height: 60.0,width: 60.0),
                Text("My To Do",
                  style:TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6C1D45),
                  ),
                ),
                SizedBox(
                  height: 150,

                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.inbox,
                        size: 100,
                        color: Color(0xFF6C1D45),
                      ),
                      SizedBox(height: 10),
                      
                      Text("No items",
                        style: TextStyle(fontSize: 18,color: Color(0xFF6C1D45),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),

        ),
      ):

                    Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20.0,width: 20.0),
              const Text("My To Do",
                style:TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C1D45),
                ),
              ),

      Expanded (
        child:ListView.builder(
        physics:const BouncingScrollPhysics(),
              itemCount: _taskList.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context,index){
            String taskDate=_taskList[index].date;
            String taskPriority=_taskList[index].priority;
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TasklistUpdate(),));
              },
            child:Card(

        color: Colors.white,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20),
             side: const BorderSide(
         color: Color(0xFF6C1D45),
         width: 1
             )
           ),
            margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: ListTile(
            title: Text(_taskList[index].title,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF6C1D45)),),
            subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(_taskList[index].description),
              Text('Date:$taskDate',style: TextStyle(fontSize: 16,color: Colors.yellow[800],),),
            Text('Priority:$taskPriority',style: TextStyle(fontSize: 16,color: Colors.yellow[800],),),
        Text('States:',style: TextStyle(fontSize: 16,color: Colors.yellow[800],),),
            ],
            ),


              trailing:IconButton(
          icon: const Icon(Icons.delete),
          onPressed: (){
            _dbHelper.deleteTask(_taskList[index].id!);
            _loadTasks();

          },
        ),

              ),


          ),


            );
            },

        ),
        ),
      ],
    ),

                    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>const AddTaskScreen(),),);

        },

        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF6C1D45),
          ),
          constraints: const BoxConstraints.expand(),
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(

        color: const Color(0xFF6C1D45),
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            IconButton(
        icon: const Icon(Icons.favorite_outline_rounded),
        onPressed:(){},
        color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.bookmark_border_rounded),
              onPressed:(){},
              color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed:(){},
              color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed:(){},
              color: Colors.white,
            ),
          ],
        ),

      ),
    ),
    );
  }
}

