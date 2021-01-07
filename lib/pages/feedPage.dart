import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instaui10/model/post_model.dart';
import 'package:instaui10/model/story_model.dart';
class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];
  List<Post> _posts = [
    Post(
        username: "Brianne",
        userImage: "assets/images/user_1.jpeg",
        postImage: "assets/images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Henri",
        userImage: "assets/images/user_2.jpeg",
        postImage: "assets/images/feed_2.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Mariano",
        userImage: "assets/images/user_3.jpeg",
        postImage: "assets/images/feed_3.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Strories",style: TextStyle(color: Colors.grey,fontSize: 14),),
                    Text("Watch all",style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ],
                ),
              ),
              //Strory List
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story){
                    return _itemOfStory(story);
                  }).toList(),

                ),

              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _posts.length,
                    itemBuilder: (ctx, i) {
                      return _itemOfPost(_posts[i]);
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(width: 3,color: Color(0xFF8e44ad),),

          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,

              ),

            ),
          ),

        ),
        SizedBox(height: 10,),
        Text(story.name),


      ],
    );
  }
  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          //header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.username),
                  ],
                ),
                IconButton(
                    icon: Icon(SimpleLineIcons.options),
                    onPressed: (){}
                    ),
              ],
            ),

          ),
          FadeInImage(//bu narsa asosiy rasm javob bermasa yoki yoq bolsa placeholderdagi default imageni oladi
              placeholder: AssetImage("assets/images/placeholder.png"),
              image: AssetImage(post.postImage)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(icon: Icon(FontAwesome.heart_o), onPressed: (){}),
                  IconButton(icon: Icon(FontAwesome.comment_o), onPressed: (){}),
                  IconButton(icon: Icon(FontAwesome.send_o), onPressed: (){}),
                ],
              ),
              IconButton(icon: Icon(FontAwesome.bookmark_o), onPressed: (){}),

            ],

          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children:[
                  TextSpan(
                      text:"Liked By ",
                    style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                      text:"Sigmud, ",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text:"Dayana, ",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text:"Yessenia  ",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text:"and",
                      style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                      text:"1236others ",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                  ),
                ]
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                      text:post.username,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),

                  ),
              TextSpan(
                  text:" ${post.caption}",
                  style: TextStyle(color: Colors.black),
              )
                ]
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text(
              "February 2020",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),

          )
        ],

      ),

    );
  }
}
