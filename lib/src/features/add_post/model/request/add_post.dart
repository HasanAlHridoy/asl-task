part 'add_post.ext.dart';

class Post {
  int? id; // Optional ID for the post
  final String? title;
  final String? body;

  Post({this.id, this.title, this.body});

  // Convert JSON to Post object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int?,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  // Convert Post object to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}

class PostList {
  final List<Post>? data;
  PostList({this.data});

  // For JSON containing a "data" array
  factory PostList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Post> posts = list.map((i) => Post.fromJson(i)).toList();
    return PostList(data: posts);
  }

  Map<String, dynamic> toJson() {
    return {'data': data?.map((post) => post.toJson()).toList()};
  }
}
