import 'package:flutter/material.dart';
import 'package:store/Featured/Screens/Widgets/custom_favourite_item.dart';

class CustomFavouriteListView extends StatelessWidget {
  const CustomFavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const CustomFavuriteItem(),
      separatorBuilder:
          (context, index) =>
              const Divider(color: Colors.grey, thickness: 0, height: 30),
      itemCount: 10,
    );
  }
}
