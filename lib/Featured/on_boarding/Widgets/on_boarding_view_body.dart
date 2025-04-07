import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/utils/assets.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Cubit/App_cubit/app_state.dart';
import 'package:store/Featured/on_boarding/Widgets/custom_page_indicator.dart';
import 'package:store/Featured/on_boarding/Widgets/custom_page_view.dart';
import 'package:store/Models/on_boarding_model.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});
  static const items = [
    OnBoardingModel(
      image: Assets.imagesECommerce,
      title: "on 1 title",
      subTitle: "on board body",
    ),
    OnBoardingModel(
      image: Assets.imagesFinance,
      title: "on 2 title",
      subTitle: "on board body",
    ),
    OnBoardingModel(
      image: Assets.imagesLogistics,
      title: "on 3 title",
      subTitle: "on board body",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: CustomPageView(items: items, cubit: cubit),
              ),
              const SizedBox(height: 100),
              CustomPageIndicator(cubit: cubit, items: items),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}