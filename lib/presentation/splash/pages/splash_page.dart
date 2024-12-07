import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/assets/app_images.dart';
import 'package:movie_app/presentation/auth/pages/signin_page.dart';
import 'package:movie_app/presentation/home/pages/home_page.dart';
import 'package:movie_app/presentation/splash/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashUnAuthenticated) {
            AppNavigation.pushReplacement(context, const SigninPage());
          } else if (state is SplashAuthenticated) {
            AppNavigation.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff1A1B20).withOpacity(0.3),
                    const Color(0xff1A1B20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
