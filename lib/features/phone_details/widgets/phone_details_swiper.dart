import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class PhoneDetailsSwiper extends StatelessWidget {
  const PhoneDetailsSwiper({Key? key, required this.phoneImages})
      : super(key: key);
  final List<String> phoneImages;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 941 * 349,
      child: Swiper(
        itemCount: 1,
        pagination: SwiperPagination.rect,
        viewportFraction: 0.6,
        scale: 0.8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.091),
                  offset: Offset(0, 1), //(-2.83, 14.93
                  blurRadius: 30.0,
                  spreadRadius: 2,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(250, 250, 250, 180),
                        Color.fromRGBO(250, 250, 250, 80),
                      ],
                    )),
                child: Image.network(
                  phoneImages[0],
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
