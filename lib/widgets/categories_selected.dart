import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  int selectIndex = 0;

  List<String> categories = ['Messages', 'Online', 'Group', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: 20,
                      color: selectIndex == index
                          ? Colors.white
                          : Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
    );
  }
}

