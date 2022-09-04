import 'package:e_furniture/core/bloc/app_level_bloc.dart';
import 'package:e_furniture/features/authentication/presentation/screens/home_screen.dart';
import 'package:e_furniture/features/authentication/presentation/screens/login_screens.dart';
import 'package:e_furniture/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLevelBloc, AppLevelState>(
      listener: (context, state) {
        if (state is AppFirstTime) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen()));
        }
        if (state is AppLevelUnauthenticated) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
        if (state is AppLevelAuthenticated) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
