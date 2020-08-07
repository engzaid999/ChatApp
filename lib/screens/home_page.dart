import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messengermobile/widgets/categories_selected.dart';
import 'package:messengermobile/widgets/favorite_contacts.dart';
import 'package:messengermobile/widgets/recent_chat.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Categories(),
            ),
            Positioned(
              top: 70,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:Colors.teal[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: FavoriteCon(),
              ),
            ),
            RecentChat(),
          ],
        ));
  }
}
