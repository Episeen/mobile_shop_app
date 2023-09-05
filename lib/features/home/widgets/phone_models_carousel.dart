import 'package:flutter/material.dart';
import 'package:phone_selling_app/utils/app_colors.dart';
import '../models/home_store.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PhoneModelsCarousel extends StatelessWidget {
  const PhoneModelsCarousel({Key? key, required this.homeStores})
      : super(key: key);
  final List<HomeStore> homeStores;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 182,
        viewportFraction: 1,
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        scrollDirection: Axis.horizontal,
      ),
      items: homeStores.map((item) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 182,
                decoration: BoxDecoration(color: Colors.white70),
                child: Image.network(item.picture, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 93,
              left: 25,
              child: Text(
                item.title,
                style: TextStyle(
                  color: item.id == 2 ? Colors.black : Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              bottom: 75,
              left: 25,
              child: Text(
                item.subtitle,
                style: TextStyle(
                  color: item.id == 2 ? Colors.black : Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              left: 25,
              child: Container(
                decoration: BoxDecoration(
                    color: item.id == 2 ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 5),
                  child: Text(
                    'Buy now!',
                    style: TextStyle(
                      color: item.id == 2 ? Colors.white : Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 141,
              left: 25,
              child: Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                    color: AppColors.colorOrange,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text('New',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
