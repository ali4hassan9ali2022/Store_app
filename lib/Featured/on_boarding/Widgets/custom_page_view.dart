import 'package:flutter/material.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Featured/on_boarding/Widgets/custom_on_boarding_item.dart';
import 'package:store/Models/on_boarding_model.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.items,
    required this.cubit,
  });

  final List<OnBoardingModel> items;
  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: items.length,
      controller: cubit.pageController,
      onPageChanged: (value) {
        cubit.lastPageView(value);
      },
      itemBuilder:
          (context, index) =>
              CustomOnBoardingItem(items: items[index]),
    );
  }
}