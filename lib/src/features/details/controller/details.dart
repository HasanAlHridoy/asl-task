import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef DetailsNotifier = NotifierProvider<DetailsProvider, void>;

final detailsProvider = DetailsNotifier(DetailsProvider.new);

class DetailsProvider extends Notifier<void> {
  @override
  void build() {
    debugPrint('DetailsProvider');
  }
}
