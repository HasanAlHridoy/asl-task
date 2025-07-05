import 'package:asl_task/src/core/config/size/size.dart';
import 'package:asl_task/src/core/router/go_router.dart';
import 'package:asl_task/src/core/utils/extensions/context.dart';
import 'package:asl_task/src/core/utils/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // Hive service
  await Hive.initFlutter();
  await Hive.openBox<dynamic>('asl');
  runApp(
    DevicePreview(
      builder: (context) {
        return ProviderScope(child: MyApp());
      },
    ),
  );
  //runApp(ProviderScope(child: const MyApp()));
}

void configEasyLoading(BuildContext context) {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..boxShadow = const <BoxShadow>[]
    ..indicatorColor = Colors.teal
    ..progressColor = Colors.teal
    ..textColor = Colors.white
    ..textStyle = const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold)
    ..dismissOnTap = false
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withValues(alpha: 0.8)
    ..indicatorWidget = SizedBox(
      height: 100.h,
      width: 100.w,
      child: SpinKitThreeBounce(color: Color(0xff316EED), size: 30.0),
    )
    ..indicatorType = EasyLoadingIndicatorType.spinningCircle;
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp.router(
        title: 'ASL',
        routerConfig: ref.watch(goRouterProvider),
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(
          builder: (ctx, child) {
            configEasyLoading(context);
            topBarSize = ctx.padding.top;
            bottomViewPadding = ctx.padding.bottom;
            return MediaQuery(
              data: ctx.mq.copyWith(devicePixelRatio: 1.0, textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
