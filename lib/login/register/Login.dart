import 'package:data_base/Home.dart';
import 'package:data_base/login/register/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 TextEditingController emailcontroller=TextEditingController();
 TextEditingController passwordcontroller=TextEditingController();
 bool islogin=false;
  loginuser()async{
    try {
      islogin=true;
      setState(() {});
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email:emailcontroller.text ,
    password: passwordcontroller.text,
  );
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
} on FirebaseAuthException catch (e) {
  islogin =false;
  setState(() {});
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: SingleChildScrollView(
           child: Column(
            children: [
              
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Container(
                 width: 200.0, // Set the width to create a circle
                 height: 200.0, // Set the height to the same value
                 decoration: BoxDecoration(
            shape: BoxShape.circle, // Set the shape to a circle
            // Set the background color
                 ),
                 child: Image(
            image: NetworkImage(
              "https://tse3.mm.bing.net/th?id=OIP.h-h_qMscTTMqZEcNXDrNiQHaHa&pid=Api&P=0&h=220"
              ),),),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              // CircleAvatar(child: Image.network("https://tse3.mm.bing.net/th?id=OIP.h-h_qMscTTMqZEcNXDrNiQHaHa&pid=Api&P=0&h=220"),),
                 TextField(
            controller: emailcontroller,decoration: InputDecoration(
            hintText:"Email Address",
            labelText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80),
              
              )),),
             
                 Text(""),
             
                 TextField(
            
            controller: passwordcontroller,decoration: InputDecoration(
              //  focusedBorder: OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.green), // Change the border color when focused
              //   ),
              //   enabledBorder: OutlineInputBorder(
              //     borderSide: BorderSide(color: const Color.fromARGB(255, 68, 94, 116)), // Change the border color when not focused
              //   ),
            hintText: "password",
            labelText: "Password",
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
              
              )),),
             
            Padding(padding: EdgeInsets.only(bottom: 50)),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 33, 243, 215), // Background color
              onPrimary: Colors.white, // Text color
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Button shape (circular in this case)
              ),
            ),
                onPressed: (){
             loginuser();
            
              }, child:Text("Login")),
              Padding(padding: EdgeInsetsDirectional.only(bottom: 10)),
             InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
        },child: Text("Sign out.")),
            Visibility(visible:islogin,child: CircularProgressIndicator()),

              ],),
         ),
      ),
    );
  }
}