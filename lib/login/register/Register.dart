import 'package:data_base/Home.dart';
import 'package:data_base/login/register/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
 registeruser()async{
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:emailcontroller.text,
    password: passwordcontroller.text,
  );
  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
           TextField(
          controller: emailcontroller,decoration: InputDecoration(
          hintText:"Email Address",
          labelText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            
            )),),
      
        Text(""),
      
        TextField(
          maxLength: 6,
         controller: passwordcontroller,decoration: InputDecoration(
          hintText: "password",
          labelText: "Password",
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
            
            )),),
            
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
              registeruser();
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
            }, child:Text("Register")),
            Padding(padding: EdgeInsetsDirectional.only(bottom: 10)),
            InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          },child: Text("Already have an account?")),
            ],),
      ),
    );
  }
}