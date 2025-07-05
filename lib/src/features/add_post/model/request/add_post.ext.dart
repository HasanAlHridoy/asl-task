part of 'add_post.dart';

extension PostCopyWith on PostList {
  PostList copyWith({List<Post>? data}) {
    return PostList(data: data ?? this.data);
  }
}
