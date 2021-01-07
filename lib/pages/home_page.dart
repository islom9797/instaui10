import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instaui10/pages/feedPage.dart';
class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}
int currentpage=0;
class _HomePageState extends State<HomePage> {
  var pages=[
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text("Instagram",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Feather.camera),
          color: Colors.black,
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Feather.tv),
            color: Colors.black,
            onPressed: (){},
          ),

          IconButton(
            icon: Icon(Feather.send),
            color: Colors.black,
            onPressed: (){},
          ),
        ],
      ),
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentpage,
        onTap: (i){
          setState(() {
            currentpage=i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,

        items: [
          BottomNavigationBarItem(
              icon: Icon(Foundation.home),
            title: Text("FEED")
          ),

          BottomNavigationBarItem(
              icon: Icon(Feather.search),
              title: Text("Search")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.plus_square),
              title: Text("upload")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.heart),
              title: Text("Likes")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.user),
              title: Text("Account")
          ),
        ],
      ),
    );
  }
}
