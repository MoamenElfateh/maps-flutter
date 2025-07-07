import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth_cubit.dart';
import 'package:maps_flutter/core/routing/routes.dart';
import 'package:maps_flutter/features/login/login_screen.dart';
import 'package:maps_flutter/features/map/map_screen.dart';
import 'package:maps_flutter/features/otp/otp_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!,
                child: LoginScreen(),
              ),
        );
      case Routes.otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!,
                child: OtpScreen(phoneNumber: phoneNumber.toString()),
              ),
        );
      default:
        return null;
    }
  }
}
