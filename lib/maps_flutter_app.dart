import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_flutter/core/routing/app_router.dart';

class MapsFlutterApp extends StatelessWidget {
  final AppRouter appRouter;
  const MapsFlutterApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
