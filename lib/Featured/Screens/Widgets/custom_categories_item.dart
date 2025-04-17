import 'package:flutter/material.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        const Image(
          image: NetworkImage(
            "https://student.valuxapps.com/storage/uploads/banners/1732402018qoY0L.banner1.png",
          ),
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Container(
          width: 100,
          color: Colors.black.withOpacity(0.8),
          child: const Text(
            "Laptop",
            style: TextStyle(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}