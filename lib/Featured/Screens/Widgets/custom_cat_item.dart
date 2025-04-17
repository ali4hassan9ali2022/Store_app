import 'package:flutter/material.dart';
import 'package:store/Models/categories_mode.dart';

class CustomCatItem extends StatelessWidget {
  const CustomCatItem({super.key, required this.dataModel});
  final DataModel dataModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: NetworkImage(dataModel.image ?? ""),
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 20),
        Text(
          dataModel.name ?? "",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}