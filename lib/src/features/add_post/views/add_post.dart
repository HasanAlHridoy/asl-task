import 'package:asl_task/src/core/utils/extensions/context.dart';
import 'package:asl_task/src/features/add_post/controller/add_and_edit.dart';
import 'package:asl_task/src/features/add_post/controller/add_post.dart';
import 'package:asl_task/src/features/add_post/views/components/add_and_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPostView extends ConsumerWidget {
  const AddPostView({super.key});
  static const String name = 'add-post-view';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(addPostProvider);
    final posts = ref.watch(postListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Add Post')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (BuildContext context) {
              return const AddAndEditForm();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: posts.isEmpty
          ? Center(child: Text('No posts available', style: context.text.bodyLarge))
          : Column(
              children: posts.map((post) {
                return ListTile(
                  title: Text(post.title ?? ''),
                  subtitle: Text(post.body ?? ''),
                  trailing: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (BuildContext context) {
                          return AddAndEditForm(post: post);
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                );
              }).toList(),
            ),
      // ListView.builder(
      //   itemCount: posts.length,
      //   itemBuilder: (context, index) {
      //     final post = posts[index];
      //     return ListTile(title: Text(post.title ?? ''), subtitle: Text(post.body ?? ''));
      //   },
      // ),
    );
  }
}
