import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Models/home_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<StoreCubit>(context);
    return Container(
      color:
          BlocProvider.of<AppCubit>(context).isDark
              ? Colors.black
              : Colors.white,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  //   color: BlocProvider.of<AppCubit>(context).isDark
                  // ? Colors.black
                  // : Colors.white,
                  imageUrl: productModel.image.toString(),

                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              if (productModel.price != 0)
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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, height: 1.3),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "${productModel.price} "
                        r"$",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (productModel.price != 0)
                      Flexible(
                        child: Text(
                          "${productModel.oldPrice} "
                          r"$",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        cubit.changeFavorites(productModel.id!);
                        print(productModel.id.toString());
                      },
                      icon: Icon(
                        cubit.favorites[productModel.id]!
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 14,
                        color:
                            cubit.favorites[productModel.id]!
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
    );
  }
}


// image: NetworkImage(),

