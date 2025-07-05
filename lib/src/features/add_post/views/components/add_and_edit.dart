import 'package:asl_task/src/core/config/size/size.dart';
import 'package:asl_task/src/core/utils/extensions/context.dart';
import 'package:asl_task/src/features/add_post/controller/add_and_edit.dart';
import 'package:asl_task/src/features/add_post/model/request/add_post.dart';
import 'package:asl_task/src/shared/app_buttons/app_button.dart';
import 'package:asl_task/src/shared/textfield/custom_textfields_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddAndEditForm extends ConsumerWidget {
  final Post? post;
  const AddAndEditForm({super.key, this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(addAndEditProvider(post));
    final notifier = ref.watch(addAndEditProvider(post).notifier);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Text(
                  'Add/Edit Post',
                  style: context.text.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColorDark,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Form(
              key: notifier.formKey,
              child: Column(
                spacing: 16.h,
                children: [
                  CustomTextFiledWithLabel(
                    label: 'Title',
                    controller: notifier.titleController,
                    isRequired: '*',
                    hintText: 'Enter post title',
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextFiledWithLabel(
                    label: 'Body',
                    controller: notifier.bodyController,
                    isRequired: '*',
                    maxLines: 6,
                    hintText: 'Write post body',
                  ),
                  SizedBox(height: 8.h),
                  AppButton(child: Text('Add'), onPressed: () => notifier.createPost(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
