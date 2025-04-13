import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Core/Controllers/Navigato_to.dart';
import 'package:store/Core/Widgets/custom_button.dart';
import 'package:store/Core/Widgets/custom_text_field.dart';
import 'package:store/Cubit/Log_in_cubit/log_in_cubit.dart';
import 'package:store/Cubit/Log_in_cubit/log_in_state.dart';
import 'package:store/Featured/Login_register/Views/register_view.dart';
import 'package:store/Featured/home_layout/Views/home_layout.dart';
import 'package:store/Helper/helper.dart';
import 'package:store/Models/log_in_model.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LogInCubit>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: BlocConsumer<LogInCubit, LoginStates>(
          listener: (context, state) {
            if (state is ShopLoginSucssesStates) {
              if (state.loginModel!.status!) {
                print("${state.loginModel!.message}");
                CacheHelper.saveDate(
                  key: "token",
                  value: state.loginModel?.data?.token,
                ).then((value) {
                  NavigatoTo.pushNamedAndRemoveTo(context, HomeLayout.id);
                });
              } else {
                print("${state.loginModel!.message}");
                // Helper.scaffoldMessenger(
                //   context,
                //   const Text(
                //     "Error",
                //     style: TextStyle(
                //       backgroundColor: Colors.blueAccent,
                //       color: Colors.white,
                //     ),
                //   ),
                // );
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: cubit.formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LogIn",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Login now to browse our offers ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 50),
                      CustomTextField(
                        controller: cubit.emailController,
                        validator: (value) {
                          if (value == null) {
                            return 'please enter your email address';
                          }
                          return null;
                        },
                        labelText: "E-mail",
                        hintText: "email",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: cubit.passwardController,
                        validator: (value) {
                          if (value == null) {
                            return 'please enter your passward';
                          }
                          return null;
                        },
                        labelText: 'Passward',
                        hintText: 'passward',
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.lock, color: Colors.white),
                          onPressed: () {},
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePasswordVisibility();
                          },
                          icon: Icon(cubit.suffix, color: Colors.white),
                        ),
                        obscureText: cubit.isObsecure,
                        onFieldSubmitted: (value) {},
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ConditionalBuilder(
                          condition: state is! ShopLoginLoadingStates,
                          builder:
                              (context) => CustomButton(
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                      email: cubit.emailController.text,
                                      password: cubit.passwardController.text,
                                    );
                                  }
                                },
                                text: "Login",
                              ),
                          fallback:
                              (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              // navigatTo(context, RegisterScreen());
                              NavigatoTo.pushNamedTo(context, RegisterView.id);
                            },
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
