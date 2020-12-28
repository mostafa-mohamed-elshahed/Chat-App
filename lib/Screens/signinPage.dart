import 'package:chatapp/Screens/Home.dart';
import 'package:chatapp/Screens/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CircleAvatar(
              radius: 80,
              child: Image(image: AssetImage("assets/icon/icon.png")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
                child: Text(
              "AM Chat App",
              style: TextStyle(fontSize: 25),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 16),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                prefix: Icon(Icons.email),
                filled: true,
                hintText: "Enter Your Email",
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                prefix: Icon(Icons.lock),
                filled: true,
                hintText: "Enter Your PassWord",
                labelText: "PassWord",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 40,
                width: 20,
                child: Center(child: Text("Sign In",style: TextStyle(fontSize: 20),)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't Have An Account "),
              GestureDetector(onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },child: Text(" Sign Up",style: TextStyle(color: Colors.blue),),)
            ],
          )
        ],
      ),
    );
  }
}
