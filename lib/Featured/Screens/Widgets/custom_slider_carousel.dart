import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store/Models/home_model.dart';

class CustomSliderCarousel extends StatelessWidget {
  const CustomSliderCarousel({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
    );
  }
}
