import 'package:flutter/material.dart';

class CustomFavuriteItem extends StatelessWidget {
  const CustomFavuriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                const Image(
                  image: NetworkImage(
                    "https://student.valuxapps.com/storage/uploads/banners/1732402018qoY0L.banner1.png",
                  ),
    
                  width: 120,
                  fit: BoxFit.cover,
                  height: 120,
                ),
                if (1 != 0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text(
                      "DisCount",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    // productModel.name.toString(),
                    "Ali",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1.3),
                  ),
                  Row(
                    children: [
                      const Text(
                        "50"
                        // "${productModel.price} "
                        r"$",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (1 != 0)
                        const Text(
                          "50"
                          r"$",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                        onPressed: () {
                          // cubit.changeFavorites(productModel.id!);
                          // print(productModel.id.toString());
                        },
                        icon: const Icon(
                          Icons.favorite,
                          // cubit.favorites[productModel.id]!
                          //     ? Icons.favorite
                          //     : Icons.favorite_outline,
                          // size: 14,
                          // color:
                          //     cubit.favorites[productModel.id]!
                          //         ? Colors.red
                          //         : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}