import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_selling_app/features/cart/bloc/cart_bloc.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../widgets/cart_Items_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final bloc = context.read<CartBloc>();

  @override
  void initState() {
    bloc.add(CartEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox.shrink(),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text('Error fetching data')),
            loaded: (products) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 44, top: 79),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 37,
                            height: 37,
                            padding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.colorBlue,
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_back_ios,
                                  color: Colors.white, size: 18),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text('Add address', style: AppTextStyles.txt15w500),
                        SizedBox(width: 9),
                        Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.colorOrange,
                          ),
                          child: const Center(
                            child: Icon(Icons.location_on_outlined,
                                size: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 42, top: 50),
                    child: Text('My Cart', style: AppTextStyles.txt35w700),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 49),
                      decoration: const BoxDecoration(
                        color: AppColors.colorBlue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        // padding: EdgeInsets.only(top: 34),
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                for (int i = 0; i < products.length; i++)
                                  CartItemsTile(
                                    cartItemTitle: products[i].title,
                                    cartItemPrice:
                                        '\$${products[i].price.toStringAsFixed(2)}',
                                    cartItemImage: products[i].image,
                                  ),
                                const Divider(color: Colors.white, height: 25),
                                SizedBox(height: 15),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Total',
                                        style: AppTextStyles.txt15w400.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '\$6,000 US}',
                                        style: AppTextStyles.txt15w400.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Delivery',
                                        style: AppTextStyles.txt15w400.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Free',
                                        style: AppTextStyles.txt15w400.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                const Divider(color: Colors.white),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Checkout'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
