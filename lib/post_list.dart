import 'package:flutter/material.dart';
import 'package:posts/posts.dart';
import 'package:http/http.dart' as http;
import 'package:posts/posts_detail.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  var url ="https://github.com/Gabriela1004/posts/blob/master/posts.json";

  Proyecto proyecto;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    proyecto = Proyecto.fromJson(decodedJson);
    setState(() {



        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(),
      body: proyecto==null ? Center(child: CircularProgressIndicator(),) :
      GridView.count(
        crossAxisCount: 2,
        children: proyecto.posts.map((p)=> Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetail(posts: p,)));
            },
            child: Hero(
              tag: p.userId,
              child: Card(
                elevation: 3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(p.title)
                          )
                      ),
                    ),
                    Text(
                      p.body,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
        )).toList(),
      ),
    );
  }
}



