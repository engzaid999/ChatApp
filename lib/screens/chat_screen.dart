import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messengermobile/models/message_model.dart';
import 'package:messengermobile/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Message message = Message();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.user.name),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),

      // This Line used foe hide Keyboard when touch in any space
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15),
                      itemCount: messages.length,
                      itemBuilder: (context, int index) {
                        final Message message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(left: 8, bottom: 8, top: 8)
          : EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.80,

      // Chat Message decoration
      decoration: BoxDecoration(
        color: isMe ? Colors.amber[100] : Colors.teal[100],
        borderRadius: isMe
            ? BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )
            : BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black45),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            message.text,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30,
          color: message.isLiked ? Colors.redAccent : Colors.black54,
          onPressed: () {},
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      height: 60,
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.image, size: 20, color: Colors.teal,),
              onPressed: () {}),

          Expanded(
            child: TextField(
              // This line used to chang the font type to Capital letter for first letter in the words
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value){},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),


          IconButton(icon: Icon(Icons.send, size: 20, color: Colors.teal,),
              onPressed: () {}),
        ],
      ),
    );
  }
}



















