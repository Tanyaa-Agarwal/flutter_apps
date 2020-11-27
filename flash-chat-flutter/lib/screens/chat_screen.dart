import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
final _firestore =FirebaseFirestore.instance;
User loggedInUser;
class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController =TextEditingController();
  final _auth= FirebaseAuth.instance;

  String messageText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async{
    try{final user = await _auth.currentUser;
    if(user != null)
    {
      loggedInUser=user;
      print(loggedInUser.email);
    }}
    catch(e){
      print(e);
    }
  }
  // void getMessages() async{
  //   final messages = await _firestore.collection('messages').getDocuments();

  // }
  void messagesStream()async{
    await for(var snapshotquery in _firestore.collection('messages').snapshots()){
      for (var textmessage in snapshotquery.docs)
      {
        print(textmessage.data);

      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  
                  _auth.signOut();
                  Navigator.pop(context);
                  //Implement logout functionality
                }),
          ],
          title: Text('⚡️Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
               MessagesStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText=value;
                          //Do something with the user input.
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        messageTextController.clear();
                     _firestore.collection('messages').add({
                       'text' : messageText,
                       'sender' :loggedInUser.email,
                     });
                        //Implement send functionality.
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}
class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      //snapshot here is asynchronous snapshot different from firebase snapshot which is querysnapshot
      builder:(context,snapshot){
        if(!snapshot.hasData)
        {
          return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              )
          );
        }
        final messages= snapshot.data.docs.reversed;
        List<MessageBubble>  messageWidgets =[];
        for(var message in messages )
        {
          final chatMessage= message.data()['text'];
          final chatSender = message.data()['sender'];
          final currentUser =loggedInUser.email;
          if(currentUser==chatSender){
            //the mssg is from logged in user
          }
          final chatWidget = MessageBubble(
            chatSender: chatSender,
            chatMessage: chatMessage,
          isMe: currentUser==chatSender,);
          messageWidgets.add(chatWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
            children: messageWidgets,
          ),
        );

      }, );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this
  .chatSender,this.chatMessage,this.isMe});
  final String chatSender;
  final String chatMessage;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(10.0),
      child:Column(

     crossAxisAlignment: isMe ==true? CrossAxisAlignment.end: CrossAxisAlignment.start,


        children: [
          Text(chatSender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe?BorderRadius.only(topLeft:Radius.circular(30.0),bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0), ):
                BorderRadius.only(topRight: Radius.circular(30.0),bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),),
            elevation: 5.0,
            color: isMe==true?Colors.lightBlueAccent:Colors.white ,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Text(chatMessage,
                style: TextStyle(
                  color: isMe==true? Colors.white : Colors.black54 ,
                  fontSize: 15.0,
                ),),
            ),
          ),
        ],
      ),

    );
  }
}
