import 'package:chatapp/constants.dart';
import 'package:chatapp/features/chat/models/messageModels.dart';
import 'package:chatapp/helper/SizeConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatViewBody extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String message;
  final String uid;

  TextEditingController textEditingController = TextEditingController();

  ChatViewBody({@required this.uid});
  @override
  Widget build(BuildContext context) {
    CollectionReference messagesRef = firestore.collection(KMessagesRef);
    messagesRef.doc("7Cxgc5tdwMzmIiRD7fO5").get();
    return StreamBuilder<QuerySnapshot>(
        stream: messagesRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messages = [];
            for (var doc in snapshot.data.docs) {
              messages.add(MessageModel(
                  message: doc.get(KMessage), sender: doc.get(KSender)));
            }
            return Column(

              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: messages
                          .map((e) => Directionality(
                        textDirection:(e.sender == uid)
                            ?TextDirection.ltr :TextDirection.rtl,
                            child: Row(
                                  mainAxisAlignment: (e.sender == uid)
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Text(TimeOfDay.fromDateTime (Timestamp.now().toDate()).format(context),style: TextStyle(fontSize: 10),),
                // Timestamp.now().toDate().toLocal().toString().trim()
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 16, right: 16),
                                      child: Container(
                                        width: SizeConfig.defaultSize*33.5,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: (e.sender == uid)
                                              ?Colors.grey
                                              :Colors.blueGrey
                                            ,
                                            border:
                                            Border.all(
                                                width: 1,
                                                style: BorderStyle.solid),

                                            borderRadius: (e.sender == uid)?
                                            BorderRadius.only(
                                                topRight: Radius.circular(0),
                                                topLeft: Radius.circular(50),
                                                bottomLeft: Radius.circular(50),
                                                bottomRight: Radius.circular(50))
                                                :BorderRadius.only(
                                                topRight: Radius.circular(50),
                                                topLeft: Radius.circular(0),
                                                bottomLeft: Radius.circular(50),
                                                bottomRight: Radius.circular(50))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Directionality(
                                            textDirection:(e.sender == uid)
                                                ?TextDirection.rtl :TextDirection.ltr,
                                            child: SingleChildScrollView(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.message ?? "",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: (e.sender == uid)
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                          ))
                          .toList(),
                    ),
                  ),
                ),
                TextField(
                  controller: textEditingController,
                  onChanged: (value) {
                    message = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your Message",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        messagesRef.add({
                          KMessage: message,
                          KSender: uid,
                          KTime: Timestamp.now(),
                        });
                        textEditingController.clear();
                      },
                      child: Icon(
                        Icons.send,
                        color: KLogoColor,
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
