import 'package:asl_task/src/core/config/size/size.dart';
import 'package:asl_task/src/core/router/app_routers.dart';
import 'package:asl_task/src/core/utils/extensions/context.dart';
import 'package:asl_task/src/features/home/controller/home.dart';
import 'package:asl_task/src/shared/riverpod/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const String name = 'home-view';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(homeProvider)
        .when(
          error: (e, s) => riverpodError(e, s),
          loading: () => SizedBox(),
          data: (_) {
            final notifier = ref.watch(homeProvider.notifier);
            return Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                actions: [IconButton(onPressed: () => context.push(AppRoutes.addPostRoute), icon: const Icon(Icons.add_circle_outline))],
              ),
              body: RefreshIndicator(
                onRefresh: () => notifier.fetchHomeData(),
                color: context.theme.scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: notifier.searchController,
                              style: context.text.bodyMedium!,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: context.text.bodyMedium!.copyWith(color: context.theme.dividerColor),
                                suffixIcon: IconButton(
                                  onPressed: () => notifier.search(),
                                  icon: Icon(Icons.search, color: context.theme.dividerColor),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: context.theme.shadowColor.withValues(alpha: 0.3)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: context.theme.shadowColor.withValues(alpha: 0.3)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: context.theme.shadowColor.withValues(alpha: 0.6)),
                                ),
                              ),
                              textInputAction: TextInputAction.send,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                            ),
                          ),
                          const SizedBox(width: defaultPadding),
                          Text('Total item: ${notifier.homeData.length}', style: context.text.bodyMedium!),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: notifier.homeData.length,
                        itemBuilder: (context, index) {
                          final item = notifier.homeData[index];
                          return ListTile(
                            onTap: () => context.push(AppRoutes.detailsRoute, extra: item),
                            titleAlignment: ListTileTitleAlignment.titleHeight,
                            leading: CircleAvatar(
                              backgroundColor: context.theme.primaryColor,
                              child: Text(
                                item.title[0].toUpperCase(),
                                style: TextStyle(color: context.theme.scaffoldBackgroundColor),
                              ),
                            ),
                            title: Text(item.title),
                            titleTextStyle: context.text.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }
}
