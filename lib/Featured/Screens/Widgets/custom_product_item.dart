import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store/Featured/Screens/Widgets/grid_item.dart';
import 'package:store/Models/home_model.dart';

class CustomPeoductItem extends StatelessWidget {
  const CustomPeoductItem({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
            items:
                homeModel.data!.banners
                    ?.map(
                      (e) => Image.network(
                        e.image.toString(),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 1 / 1.61,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(homeModel.data!.products!.length, (index) {
              return ProductItem(
                productModel: homeModel.data!.products![index],
              );
            }),
          ),
        ],
      ),
    );
  }
}
