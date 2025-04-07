import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/Core/Controllers/Navigato_to.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Featured/Login_register/Views/log_in_view.dart';
import 'package:store/Models/on_boarding_model.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.cubit,
    required this.items,
  });

  final AppCubit cubit;
  final List<OnBoardingModel> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmoothPageIndicator(
          controller: cubit.pageController,
          count: items.length,
          effect: const ExpandingDotsEffect(
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 5,
            expansionFactor: 4,
            activeDotColor: Colors.deepOrange,
          ),
        ),
        const Expanded(child: SizedBox()),
        FloatingActionButton(
          onPressed: () {
            if (cubit.isLast) {
              NavigatoTo.pushNamedAndRemoveTo(context, LogInView.id);
            } else {
              cubit.pageController.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            }
          },
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
      ],
    );
  }
}
