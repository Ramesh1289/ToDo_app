
import 'package:flutter/material.dart';
import 'package:todo_app/Screens/myprofile.dart';
import 'package:todo_app/Screens/mytodo.dart';
import 'package:todo_app/Screens/profile.dart';
import 'package:todo_app/Screens/signin.dart';
import 'package:todo_app/models/user.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Mytodo(),));
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
            child: const Icon(Icons.arrow_back,
            color: Color(0xFF6C1D45),
            ),
          )
          ,
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF6EEE2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(padding: const EdgeInsets.all(3),
              child: const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/profile avatar.png'),
            ),
            ),

            const SizedBox(height: 2),
            const Text(
              'RAMESH',
              style: TextStyle(fontFamily: 'Alfa Slab One',fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xFF6C1D45)),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Completed Task'),
              onTap: () {
                // Add action for Completed Task
              },
            ),
            ListTile(
              title: const Text('To Do'),
              onTap: () {
                // Add action for To Do
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => const MyDetails(),));
              },
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SigninPage(),));
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF6C1D45),
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () {},
              color: Colors.white,
            ),
            const SizedBox(width: 48), // Space for FAB
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
              color: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

