import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messengermobile/models/user_model.dart';
import 'package:messengermobile/screens/chat_screen.dart';

class FavoriteCon extends StatefulWidget {
  @override
  _FavoriteConState createState() => _FavoriteConState();
}

class _FavoriteConState extends State<FavoriteCon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Favorite contacts',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 25,
                    color: Colors.black54,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(user: favorites[index],),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
