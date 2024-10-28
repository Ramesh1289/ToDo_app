import 'package:flutter/material.dart';
//import 'package:todo_app/Screens/addtask.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/service/databaseservice.dart';

class TasklistUpdate extends StatefulWidget{

  @override
  State<TasklistUpdate> createState() => _TasklistUpdateState();
}

class _TasklistUpdateState extends State<TasklistUpdate> {

  String status='To DO';
  String priority='High';
  final TextEditingController _descriptioController=TextEditingController();
  @override
  void dispose(){
    _descriptioController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(scaffoldBackgroundColor:Colors.white),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          actions: [
            const Padding(
              padding:EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundImage:AssetImage('assets/images/profile avatar.png',),
                radius: 23,
              ),
            ),
          ],
          backgroundColor:const Color(0xFFF6EEE2),
          centerTitle: true,
          title: const Text("Task Details",
            style: TextStyle(fontFamily:'Alfa Slab One',fontSize: 28, fontWeight:FontWeight.bold,color:Color(0xFF6C1D45),

            ),
          ),

        ),
        body:

        Padding(
            padding:const EdgeInsets.only(top: 40,left: 16,right: 16),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [

                const SizedBox(height: 30.0,width: 30.0),
                const Text('RPA',
                  style: TextStyle(fontFamily:'Alfa Slab One',fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF6C1D45),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptioController,
                  maxLines: 5,
                  decoration:const InputDecoration(
                    //border: OutlineInputBorder(),

                  ),

                ),
                const SizedBox(height: 16),
                const Text('Status',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
                Column(
                  children: [
                RadioListTile<String>(
                  title:const Text('To DO',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xFF6C1D45)),),
                  value: 'To DO',
                  activeColor: const Color(0xFF6C1D45),
                  groupValue: status,
                  onChanged:(value){
                    setState(() {
                      status=value!;
                    }
                    );
                  },
                ),
                RadioListTile<String>(
                  title: const Text('In Progress',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xFF6C1D45)),),
                  value: 'In Progress',
                  activeColor: const Color(0xFF6C1D45),
                  groupValue: status,
                  onChanged:(value){
                    setState(() {
                      status=value!;
                    }
                    );
                  },

                ),
                RadioListTile<String>(
                  title: const Text('Complete',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xFF6C1D45)),),
                  activeColor: const Color(0xFF6C1D45),
                  value: 'Complete',
                  groupValue: status,
                  onChanged:(value){
                    setState(() {
                      status=value!;
                    }
                    );
                  },
                ),
      ],
                    ),
                const SizedBox(height: 16),
                Text('Priority:$priority',
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
                const SizedBox(height: 100),
                Center(
                  child:ElevatedButton(onPressed:(){},
                    style: ElevatedButton.styleFrom(
                      shape:const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 140),
                      backgroundColor: const Color(0xFF6C1D45),),
                    child:const Text('Update',
                      style: TextStyle(fontSize: 16,color: Colors.white),

                    ),
                  ),
                ),


        ],
      ),
        ),



        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },

          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(

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
                icon: const Icon(Icons.favorite),
                onPressed:(){},
                color: Colors.white,
              ),
              IconButton(
                icon: const Icon(Icons.bookmark),
                onPressed:(){},
                color: Colors.white,
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed:(){},
                color: Colors.white,
              ),
              IconButton(
                icon: const Icon(Icons.person),
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

