import 'package:chatapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Text("AM App"),
        ),
        centerTitle: true,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(right: 80.0),
          child: Image(
            image: AssetImage("assets/icon/icon.png"),
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
      body: ListView(
        children: [
        TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Enter your Massage",
                  suffixIcon: Icon(Icons.send),

                ),
              ),

        ],
      ),
    );
  }
}
