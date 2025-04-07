import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Cubit/App_cubit/app_state.dart';
import 'package:store/Featured/on_boarding/Widgets/custom_on_boarding_item.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: cubit.pageController,
                itemBuilder: (context, index) => const CustomOnBoardingItem(),
              ),
            ),
          ],
        );
      },
    );
  }
}
