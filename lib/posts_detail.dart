import 'package:flutter/material.dart';
import 'package:posts/posts.dart';

class PostDetail extends StatelessWidget {
  final Posts posts;
  PostDetail({this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
        title: Text(posts.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width:  MediaQuery.of(context).size.width - 20,
            left: 10,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),

                  Text("ID:${posts.id}"),
                  Text("userId: ${posts.userId}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: posts.userId.map((t)=>FilterChip(
                      backgroundColor: Colors.green,
                      label: Text(t, style: TextStyle(color: Colors.white),),
                      onSelected: (b){},
                    )).toList(),
                  ),
                  Text("Titulo", style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: posts.title.map((t)=>FilterChip(
                      backgroundColor: Colors.black,
                      label: Text(t, style: TextStyle(color: Colors.white),),
                      onSelected: (b){},
                    )).toList(),
                  ),


                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: posts.body,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(posts.body)
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
