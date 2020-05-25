class Proyecto {
  List<Posts> posts;

  Proyecto({this.posts});

  Proyecto.fromJson(Map<String, dynamic> json) {
    if (json['posts'] !=null){
      posts = new List<Posts>();
      json['posts'].forEach((v) {
        posts.add(new Posts.fromJson(v));
      });
    }
  }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.posts != null) {
    data['posts'] = this.posts.map((v) => v.toJson()).toList();
  }
  return data;
  }
}

class Posts {
  int userId;
  int id;
  String title;
  String body;


  Posts({this.userId,
    this.id,
    this.title,
    this.body
  });

  Posts.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json ['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
  class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment(
  this.postId, this.id, this.name, this.email, this.body);

  Comment.fromJson(Map<String, dynamic> json){
  postId = json["postId"];
  id = json["id"];
  name = json["name"];
  email = json["email"];
  body = json["body"];
  }
}