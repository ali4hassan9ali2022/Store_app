import 'package:flutter/material.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const Image(
              image: NetworkImage(
                "https://student.valuxapps.com/storage/uploads/banners/1732402018qoY0L.banner1.png",
              ),
              height: 100,
              width: 200,
              fit: BoxFit.cover,
            ),
            Container(
              width: 200,
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
        ),
      ),
    );
  }
}
