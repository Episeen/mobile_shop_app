import 'package:flutter/material.dart';
import 'package:phone_selling_app/features/home/models/best_seller.dart';
import 'package:phone_selling_app/utils/app_colors.dart';

class PhoneCard extends StatefulWidget {
  const PhoneCard({Key? key, required this.bestSeller}) : super(key: key);

  final BestSeller bestSeller;

  @override
  State<PhoneCard> createState() => _PhoneCardState();
}

class _PhoneCardState extends State<PhoneCard> {
  bool iconToggle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 227,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 168,
                child: Image.network(widget.bestSeller.id == 4444
                    ? 'https://ss7.vzw.com/is/image/VerizonWireless/motorola-edge-2022-dubaiplusna-basicpack-moonless-night-motxt22053m?fmt=webp'
                    : widget.bestSeller.picture),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Row(
                  children: [
                    Text('\$${widget.bestSeller.discount}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18)),
                    SizedBox(width: 7),
                    Text(
                      '\$${widget.bestSeller.price}',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                '${widget.bestSeller.title}',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
          Positioned(
            right: 13,
            top: 11,
            child: GestureDetector(
              onTap: () {
                iconToggle = !iconToggle;
                setState(() {});
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Icon(
                  iconToggle ? Icons.favorite : Icons.favorite_border,
                  size: 19,
                  color: AppColors.colorOrange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
