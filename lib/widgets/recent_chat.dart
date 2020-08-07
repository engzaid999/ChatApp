import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messengermobile/models/message_model.dart';
import 'package:messengermobile/screens/chat_screen.dart';

class RecentChat extends StatefulWidget {
  @override
  _RecentChatState createState() => _RecentChatState();
}

class _RecentChatState extends State<RecentChat> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 250,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, int index) {
                final Message chat=chats[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(user: chat.sender,),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10, top: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color:
                          chats[index].unread ? Colors.teal[100] : Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    height: 90,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage(chats[index].sender.imageUrl),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      chats[index].sender.name,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .45,
                                      child: Text(
                                        chats[index].text,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  chats[index].time,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                chats[index].unread
                                    ? Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          'NEW',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
