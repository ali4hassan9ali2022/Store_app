import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.hintText,
    required this.iconData,
  });
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String labelText;
  final String hintText;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      decoration: InputDecoration(
        label: Text(labelText),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 5.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefixIcon: Icon(iconData),
        hintText: hintText,
      ),
    );
  }
}
