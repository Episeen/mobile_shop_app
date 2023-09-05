import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';

class CartItemsTile extends StatelessWidget {
  final String cartItemTitle;
  final String cartItemPrice;
  final String cartItemImage;

  const CartItemsTile({
    super.key,
    required this.cartItemTitle,
    required this.cartItemPrice,
    required this.cartItemImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 46, left: 20, right: 20),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 88,
                  width: 88,
                  color: Colors.white,
                  child: Image.network(cartItemImage, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItemTitle,
                      style: AppTextStyles.txt20w500.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      cartItemPrice,
                      style: AppTextStyles.txt20w500
                          .copyWith(color: AppColors.colorOrange),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 33),
              Container(
                width: 26,
                height: 68,
                decoration: BoxDecoration(
                  color: AppColors.colorGreyDark,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.remove, color: Colors.white, size: 20),
                    Text(
                      '1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(Icons.add, color: Colors.white, size: 20),
                  ],
                ),
              ),
              SizedBox(width: 10),
              const Icon(Icons.delete_outline,
                  color: AppColors.colorGreyDark, size: 30),
            ],
          ),
        ),
      ],
    );
  }
}