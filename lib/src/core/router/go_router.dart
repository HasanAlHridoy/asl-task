import 'package:asl_task/src/core/router/app_routers.dart';
import 'package:asl_task/src/features/add_post/views/add_post.dart';
import 'package:asl_task/src/features/details/views/details.dart';
import 'package:asl_task/src/features/home/model/response/home.dart';
import 'package:asl_task/src/features/home/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goNavigatorKey = GlobalKey<NavigatorState>();
bool loggedIn = false;

/// Stores the last online route path (in-memory)
String? lastOnlineRoute;

final goRouterProvider = Provider<GoRouter>((ref) {
  // final isOffline = ref.watch(isOfflineProvider);

  return GoRouter(
    initialLocation: AppRoutes.homeRoute,
    navigatorKey: goNavigatorKey,
    debugLogDiagnostics: true,

    routes: <RouteBase>[
      GoRoute(path: AppRoutes.homeRoute, name: HomeView.name, builder: (_, __) =>  HomeView()),
      GoRoute(path: AppRoutes.detailsRoute, name: DetailsView.name, builder: (_, state) =>  DetailsView(extra: state.extra as HomeResponseModel)),
      GoRoute(path: AppRoutes.addPostRoute, name: AddPostView.name, builder: (_, __) => const AddPostView()),
    ],
  );
});
