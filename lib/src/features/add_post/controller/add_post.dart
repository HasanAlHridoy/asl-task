import 'package:asl_task/src/features/add_post/controller/add_and_edit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef AddPostNotifier = NotifierProvider<AddPostProvider, void>;

final addPostProvider = AddPostNotifier(AddPostProvider.new);

class AddPostProvider extends Notifier<void> {
  // List<Post> data = [];
  @override
  void build() async {
    ref.read(postListProvider);
  }
}
