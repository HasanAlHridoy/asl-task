import 'dart:developer';

import 'package:asl_task/src/features/add_post/controller/add_post.dart';
import 'package:asl_task/src/features/add_post/model/request/add_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

typedef AddAndEditNotifier = NotifierProviderFamily<AddAndEditProvider, void, Post?>;

final addAndEditProvider = AddAndEditNotifier(AddAndEditProvider.new);

// state for return a list of posts
final postListProvider = StateProvider<List<Post>>((ref) {
  return [];
});

class AddAndEditProvider extends FamilyNotifier<void, Post?> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  int counter = 0;
  // List<Post> posts = [];
  @override
  void build(Post? arg) {
    if (arg != null) {
      titleController.text = arg.title!;
      bodyController.text = arg.body!;
      log('Creating post with title: ${arg.title} and body: ${arg.body}');
    }
  }

  void clearControllers() {
    titleController.clear();
    bodyController.clear();
  }

  void createPost(BuildContext context) {
    if (!formKey.currentState!.validate()) return;
    final title = titleController.text.trim();
    final body = bodyController.text.trim();

    log('Creating post: $title and body: $body');
    final posts = ref.read(postListProvider);
    if (arg != null) {
      // Update existing post
      final index = posts.indexWhere((post) => post.id == arg!.id);
      if (index != -1) {
        posts[index] = Post(id: arg!.id, title: title, body: body);
        log('Post updated successfully: ${posts[index].id}');
      } else {
        log('Post not found for update');
      }
    } else {
      // Create new post
      clearControllers();
      final newPost = Post(id: counter++, title: title, body: body);
      posts.add(newPost);
    }

    ref.invalidate(addPostProvider);
    if (!context.mounted) return;
    context.pop();
  }
}
