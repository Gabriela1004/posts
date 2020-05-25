
import 'package:http/http.dart' as http;
import 'package:posts/posts.dart';

class comments {
  Future<List<Comment>> getComments(int postId) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    var response = await http.get(url);

    var comments = List<Comment>();

    if (response.statusCode == 200) {
      var comments = json.decode(response.body);

      for (var commentJson in comments) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }
}