import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Models/favouriteModel.dart';

class CustomFavuriteItem extends StatelessWidget {
  const CustomFavuriteItem({super.key, required this.favouritesModel});
  final FavouriteData favouritesModel;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<StoreCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(favouritesModel.product!.image!),

                  width: 120,
                  fit: BoxFit.cover,
                  height: 120,
                ),
                if (favouritesModel.product!.discount != 0)
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
                  Text(
                    // productModel.name.toString(),
                    favouritesModel.product!.name.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, height: 1.3),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        "${favouritesModel.product!.price}"
                        r"$",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (favouritesModel.product!.discount != 0)
                        Text(
                          "${favouritesModel.product!.oldPrice}"
                          r"$",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                        onPressed: () {
                          cubit.changeFavorites(favouritesModel.product!.id!);
                          // print(productModel.id.toString());
                        },
                        icon: Icon(
                          cubit.favorites[favouritesModel.product!.id]!
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 14,
                          color:
                              cubit.favorites[favouritesModel.product!.id]!
                                  ? Colors.red
                                  : Colors.grey,
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
