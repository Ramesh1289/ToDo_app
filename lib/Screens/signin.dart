
import 'package:flutter/material.dart';
import 'package:todo_app/Screens/mytodo.dart';
import 'package:todo_app/Screens/signup.dart';
import 'package:todo_app/service/databaseservice.dart';
import 'package:todo_app/models/user.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final Dbservice dbservice=Dbservice();
  final TextEditingController _usercontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();

  void _login() async{
    String username=_usercontroller.text;
    String password=_passwordcontroller.text;
    var user=await dbservice.getUser(username, password);
    if(user!=null){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>Mytodo(),));
    }
    else{
      showDialog(context: context, builder: (context) => AlertDialog(title: const Text('Login Failed'),content: const Text('Incorrect username or password'),
        actions: <Widget>[ElevatedButton(onPressed: ()=>Navigator.pop(context),child:const Text('Ok'))],
      ),

      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(scaffoldBackgroundColor: const Color(0xFFF6EEE2)),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("ToDo",
            style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color:Color(0xFF6C1D45)
            ),
          ),

        ),
        body: SingleChildScrollView(
          child: Container(
            key: _formKey,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            height: MediaQuery.of(context).size.height-50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    SizedBox(height: 50.0,width: 70.0),
                    Text("Sign In",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[

                const Text('Email',
                  style: TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
                ),
                                        TextField(
                                          controller: _usercontroller,
                      decoration: InputDecoration(
                          //hintText: "Email",
                          border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(18.0),
                              borderSide: BorderSide.none
                          ),
                          fillColor:Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email)
                      ),

                    ),
                    const SizedBox(height: 20),
                    const Text('Password',
                      style: TextStyle(fontSize: 16,color: Color(0xFF6C1D45)),
                    ),
                    TextField(

                      controller: _passwordcontroller,
                      decoration: InputDecoration(
                          //hintText: "Password",
                          border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(18.0),
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
                  padding: const EdgeInsets.only(top: 190,left: 25),
                  child: ElevatedButton(
                    onPressed:_login,
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor:const Color(0xFF6C1D45),
                    ),child: const  Text("Login",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),

                  ),

                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage(),));
                        },
                        child: const Text("SignUp", style: TextStyle(color: Colors.purple),)
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],

            ),

          ),
        ),
      ),
    );
  }
}
