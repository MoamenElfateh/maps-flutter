import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_flutter/core/routing/app_router.dart';
import 'package:maps_flutter/core/routing/routes.dart';
import 'package:maps_flutter/maps_flutter_app.dart';

String initialRoute = Routes.loginScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = Routes.loginScreen;
    } else {
      initialRoute = Routes.mapScreen;
    }
  });
  runApp(MapsFlutterApp(appRouter: AppRouter(), initialRoute: initialRoute));
}
