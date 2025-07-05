import 'package:asl_task/src/core/config/size/size.dart';
import 'package:asl_task/src/core/utils/extensions/context.dart';
import 'package:asl_task/src/features/home/model/response/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsView extends ConsumerWidget {
  final HomeResponseModel extra;
  const DetailsView({super.key, required this.extra});
  static const String name = 'details-view';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: ListTile(
        titleAlignment: ListTileTitleAlignment.titleHeight,
        title: Text(extra.title),
        titleTextStyle: context.text.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
        contentPadding: const EdgeInsets.all(defaultPadding),
        subtitle: Text(
          extra.body,
          style: context.text.bodyMedium!.copyWith(color: context.theme.dividerColor, height: 1.5),
        ),
      ),
    );
  }
}
