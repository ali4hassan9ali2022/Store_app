import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/Models/categories_mode.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem({super.key, required this.dataModel});
  final DataModel dataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: dataModel.image!,
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              height: 100,
              width: 200,
            ),

            //  Image(
            //   image: NetworkImage(
            //     dataModel.image ?? "",
            //   ),
            //   height: 100,
            //   width: 200,
            //   fit: BoxFit.cover,
            // ),
            Container(
              width: 200,
              color: Colors.black.withOpacity(0.8),
              child: Text(
                dataModel.name ?? "",
                style: const TextStyle(color: Colors.white),
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
