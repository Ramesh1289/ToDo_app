import 'package:flutter/material.dart';
import 'package:todo_app/Screens/profile.dart';

class MyDetails extends StatefulWidget {
  const MyDetails({super.key});

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  final userData={
    'name':'Ramesh',
    'email':'ramesh@gmail.com',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyProfile(),));
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange,
                    width: 3,
                  )

              ),

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
Card(
  shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.blueAccent,width: 2),
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: ListTile(
    title: Text('Name:${userData['name']}',
    style: TextStyle(fontSize: 18),),
  ),

),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blueAccent,width: 2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text('Email:${userData['email']}',
                  style: TextStyle(fontSize: 18),),
              ),

            )
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

