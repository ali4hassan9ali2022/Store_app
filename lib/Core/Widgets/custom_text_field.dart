import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.onFieldSubmitted,
    this.obscureText,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText ?? false,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey,
        label: Text(labelText),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 5.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}



/*
TextFormField(
                          controller: passwarController,
                          onFieldSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  Password: passwarController.text);
                            }
                          },
                          obscureText: LoginCubit.get(context).isObsecure,
                          validator: (value) {
                            if (value == null) {
                              return 'please enter your passward';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text('Passward'),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 2.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.lock),
                              onPressed: () {},
                            ),
                            hintText: 'passward',
                            suffixIcon: IconButton(
                              icon: Icon(LoginCubit.get(context).suffix),
                              onPressed: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                            ),
                          ),
                        ),

 */