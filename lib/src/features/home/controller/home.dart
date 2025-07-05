import 'dart:async';
import 'dart:developer';

import 'package:asl_task/src/features/home/model/response/home.dart';
import 'package:asl_task/src/features/home/repository/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef HomeNotifier = AsyncNotifierProvider<HomeProvider, List<HomeResponseModel>>;

final homeProvider = HomeNotifier(HomeProvider.new);

class HomeProvider extends AsyncNotifier<List<HomeResponseModel>> {
  final searchController = TextEditingController();
  List<HomeResponseModel> homeData = [];
  @override
  FutureOr<List<HomeResponseModel>> build() async {
    return fetchHomeData();
  }

  Future<List<HomeResponseModel>> fetchHomeData() async {
    try {
      EasyLoading.show();
      searchController.clear();
      final homeRepo = await ref.read(homeRepository).getHomeData();
      if (homeRepo.isSuccess && homeRepo.data != null) {
        homeData.clear();
        log('Fetched home data: ${homeRepo.data!.length} items');
        for (var item in homeRepo.data!) {
          homeData.add(HomeResponseModel.fromJson(item));
        }
        ref.notifyListeners();
        EasyLoading.dismiss();
        return homeData;
      } else {
        EasyLoading.dismiss();
        throw Exception('Failed to fetch home data: $homeRepo');
      }
    } catch (e) {
      EasyLoading.dismiss();
      rethrow; // Rethrow the error
    }
  }

  // search functionality
  List<HomeResponseModel> search() {
    // if (query.isEmpty) {
    //   return homeData;
    // }

    homeData = homeData.where((item) {
      return item.title.toLowerCase().contains(searchController.text.toLowerCase());
    }).toList();

    log('Filtered data: ${homeData.length} items found for query "${searchController.text}"');

    ref.notifyListeners();
    return homeData;
  }
}
