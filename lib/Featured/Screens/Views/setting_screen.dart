import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Core/Widgets/custom_button.dart';
import 'package:store/Core/Widgets/custom_text_field.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Cubit/store_cubit/store_state.dart';
import 'package:store/Featured/Login_register/Views/log_in_view.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<StoreCubit>(context);
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        if (state is SuccessGetUserStoreApp) {
          cubit.settingsNameController.text =
              state.loginModel.data!.name.toString();
          cubit.settingsEmailController.text =
              state.loginModel.data!.email.toString();
          cubit.settingsPhoneController.text =
              state.loginModel.data!.phone.toString();
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.userModel != null,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                child: Column(
                  children: [
                    CustomTextField(
                      keyboardType: TextInputType.text,
                      controller: cubit.settingsNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "name must not be empty";
                        }
                        return null;
                      },

                      hintText: "name",
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: cubit.settingsEmailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "name must not be email";
                        }
                        return null;
                      },

                      hintText: "email",
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      keyboardType: TextInputType.phone,
                      controller: cubit.settingsPhoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "name must not be phone";
                        }
                        return null;
                      },

                      hintText: "phone",
                      prefixIcon: const Icon(Icons.phone, color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      onPressed: () {
                        CacheHelper.removetokenData(key: "token").then((value) {
                          if(value) {
                            Navigator.pushNamedAndRemoveUntil(context, LogInView.id, (route) => false,);
                          }
                        },);
                      },
                      text:  "LogOut",
                    ),
                  ],
                ),
              ),
            );
          },
          fallback: (context) {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
