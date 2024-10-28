import 'package:flutter/material.dart';
import 'package:todo_app/Screens/signin.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/service/databaseservice.dart';



class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final Dbservice dbservice=Dbservice();
  final TextEditingController _namecontroller=TextEditingController();
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
  final TextEditingController _conpasswordcontroller=TextEditingController();
  void  _submitForm()async{
    User user=User(userName: _namecontroller.text.trim(), email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim());
    var result=await dbservice.createuser(user);
    if (result>0){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SigninPage(),));
    }

  }

  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(scaffoldBackgroundColor:Colors.white),
            home: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xFFF6EEE2),
          centerTitle: true,
          title: const Text("ToDo",
          style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color:Color(0xFF6C1D45)

          ),
          ),

        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            height: MediaQuery.of(context).size.height-50,
            width: double.infinity,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    SizedBox(height: 70.0,width: 70.0),
                    Text("Sign Up",
                      style:TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C1D45),
                      ),
                      ),
            SizedBox(
              height: 20,
            ),
                    Text("Welcome to ToDO app!",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Username',
                      style:TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
                    ),
                    TextFormField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                        //labelText: 'Username',
                      //hintText: "Username",
                          border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(0),
                              borderSide: BorderSide.none,
                          ),
                          fillColor:Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.person)
                      ),

                    ),
                    const SizedBox(height: 20),
                    const Text('Email',
                      style:TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
                    ),
                    TextFormField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          //hintText: "Email",
                          border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(0),
                              borderSide: BorderSide.none
                          ),
                          fillColor:Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email)
                      ),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Please enter a email";
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 20),
                    const Text('Password',
                      style:TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      decoration: InputDecoration(
                          //hintText: "Password",
                          border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(0),
                              borderSide: BorderSide.none
                          ),
                          fillColor:Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password)
                      ),
                    obscureText: true,
                      validator: (value){
                        if (value!.isEmpty){
                          return "Please enter a password ";
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 20),
                    const Text('Confirm Password',
                      style:TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
                    ),
                    TextField(
                      controller: _conpasswordcontroller,
                      decoration: InputDecoration(
                         // hintText: "Confirm Password",
                          border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(0),
                              borderSide: BorderSide.none
                          ),
                          fillColor:Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password)
                      ),
                obscureText: true,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 90,left: 25),
                  child: ElevatedButton(
                    onPressed:_submitForm,
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor:const Color(0xFF6C1D45),
                    ),child: const  Text("Register",
                  style: TextStyle(fontSize: 16,color: Colors.white),
          ),

                  ),

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const SigninPage(),));
                        },
                        child: const Text("Click Login", style: TextStyle(color: Colors.purple),)
                    )
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
