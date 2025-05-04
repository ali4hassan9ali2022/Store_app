import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Controllers/Navigato_to.dart';
import 'package:store/Core/Widgets/custom_button.dart';
import 'package:store/Core/Widgets/custom_text_field.dart';
import 'package:store/Cubit/register_cubit/register_cubit.dart';
import 'package:store/Cubit/register_cubit/resgister_state.dart';
import 'package:store/Featured/Login_register/Views/log_in_view.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<RegisterCubit>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Register now to browse our offers ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 50),
                      CustomTextField(
                        controller: cubit.nameController,
                        validator: (value) {
                          if (value == null) {
                            return 'please enter your Name address';
                          }
                          return null;
                        },
                        hintText: "Name",
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: cubit.emailRController,
                        validator: (value) {
                          if (value == null) {
                            return 'please enter your Email address';
                          }
                          return null;
                        },
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: cubit.phoneController,
                        validator: (value) {
                          if (value == null) {
                            return 'please enter your Phone address';
                          }
                          return null;
                        },
                        hintText: "Phone",
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: cubit.passwordRController,
                        validator: (value) {
                          if (value == null) {
                            return 'please enter your Password address';
                          }
                          return null;
                        },
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.text,
                        obscureText: cubit.isObsecure,
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePasswordVisibility();
                          },
                          icon: Icon(cubit.suffix, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ConditionalBuilder(
                          condition: true,
                          builder:
                              (context) => CustomButton(
                                onPressed: () {
                                  // if (cubit.formKey.currentState!.validate()) {
                                  //   cubit.userLogin(
                                  //     email: cubit.emailController.text,
                                  //     password: cubit.passwardController.text,
                                  //   );
                                  // }
                                },
                                text: "Register",
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
                              NavigatoTo.pushNamedTo(context, LogInView.id);
                            },
                            child: const Text(
                              'Log in',
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
