import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/splash_cubit/splash_cubit.dart';
import 'package:store/Cubit/splash_cubit/splash_state.dart';
import 'package:store/Featured/Splash/Widgets/custom_icons.dart';
import 'package:store/Featured/on_boarding/Views/on_boarding_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SplashCubit>(context);
    cubit.startSplash();
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is CompletedSplashState) {
          Navigator.of(context).pushReplacementNamed(OnBoardingView.id);
        }
      },
      builder: (context, state) {
        Widget content = const SizedBox();
        Widget text = const SizedBox();
        if (state is CartAppearSplashState) {
          content = const AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 500),
            child: CustomIcons(),
          );
        } else if (state is CartPulseSplashState) {
          content = TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: 1.1),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            builder: (context, scale, child) {
              return Transform.scale(scale: scale, child: const CustomIcons());
            },
          );
        } else if (state is ProductsFlySplashState) {
          content = Stack(
            alignment: Alignment.center,
            children: [
              const CustomIcons(),

              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.0),
                duration: const Duration(milliseconds: 800),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(-50 * value, 50 * value),
                    child: Opacity(
                      opacity: value,
                      child: const Icon(
                        Icons.phone_android,
                        color: Colors.orange,
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.0),
                duration: const Duration(milliseconds: 800),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(50 * value, 50 * value),
                    child: Opacity(
                      opacity: value,
                      child: const Icon(
                        Icons.laptop_mac,
                        color: Colors.blue,
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        } else if (state is ShowTextSplashState) {
          content = const CustomIcons();
          text = TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: Colors.blueAccent,
              end: Colors.black,
            ),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Magic Store",
                    style: TextStyle(
                      fontSize: 24,
                      color: value,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          );
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [content, text],
          ),
        );
      },
    );
  }
}







// Positioned(
              //   right: 50,
              //   top: 150,
              //   child: AnimatedContainer(
              //     duration: const Duration(milliseconds: 500),
              //     curve: Curves.easeInOut,
              //     transform: Matrix4.translationValues(-60, -80, 0),
              //     child: const Icon(Icons.phone_android, color: Colors.orange),
              //   ),
              // ),
              // Positioned(
              //   right: 50,
              //   top: 180,
              //   child: AnimatedContainer(
              //     duration: const Duration(milliseconds: 500),
              //     curve: Curves.easeInOut,
              //     transform: Matrix4.translationValues(-60, -100, 0),
              //     child: const Icon(Icons.laptop_mac, color: Colors.blue),
              //   ),
              // ),