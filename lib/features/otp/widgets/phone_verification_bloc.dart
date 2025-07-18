import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:maps_flutter/core/routing/routes.dart';
import 'package:maps_flutter/helpers/progress_indicator_helper.dart';

class PhoneVerificationBloc extends StatelessWidget {
  const PhoneVerificationBloc({super.key, required this.phoneNumberGetter});
  final String Function() phoneNumberGetter;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          ProgressIndicatorHelper.showProgressIndicator(context);
        }

        if (state is PhoneOTPVerified) {
          Navigator.pop(context);
          final phoneNumber = phoneNumberGetter();
          Navigator.of(
            context,
          ).pushReplacementNamed(Routes.mapScreen, arguments: phoneNumber);
        }

        if (state is ErrorOccurred) {
          // Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }
}
