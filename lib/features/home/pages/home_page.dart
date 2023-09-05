import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_selling_app/features/home/widgets/phone_card.dart';
import 'package:phone_selling_app/features/home/widgets/phone_models_carousel.dart';
import 'package:phone_selling_app/utils/app_colors.dart';
import 'package:phone_selling_app/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/home_bloc.dart';
import '../widgets/category_item.dart';
import '../widgets/filter_bottom_sheet.dart';

List<String> icons = [
  'assets/icons/phone.svg',
  'assets/icons/computer.svg',
  'assets/icons/health.svg',
  'assets/icons/books.svg',
  'assets/icons/pharmacy.svg'
];

List<String> iconNames = [
  'Phones',
  'Computer',
  'Health',
  'Books',
  'Pharmacy',
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int categoryIndex = 0;

  late final bloc = context.read<HomeBloc>();

  @override
  void initState() {
    bloc.add(const HomeEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.colorBlue,
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (int i) {
            if (i == 1) {
              Navigator.pushNamed(context, 'cart_page');
            }
          },
          backgroundColor: AppColors.colorBlue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, color: Colors.white, size: 8),
                  Text('  Explorer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/shopping_cart.svg',
                  height: 17, width: 17),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/heart.svg',
                  height: 17, width: 17),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/profile.svg',
                  height: 17, width: 17),
              label: '',
            ),
          ],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => const Center(child: Text('Error fetching data')),
            loaded: (phoneModels) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 33),
                        const Spacer(),
                        const Icon(Icons.location_on_outlined,
                            color: AppColors.colorOrange),
                        const SizedBox(width: 11),
                        const Text('Zihuatanejo, Gro',
                            style: AppTextStyles.txt15w500),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return FilterBottomSheet(
                                  brandList: phoneModels[0]
                                      .homeStores
                                      .map((e) => e.title)
                                      .toList(),
                                  priceList: [
                                    for (final model
                                        in phoneModels[0].bestSellers)
                                      model.discount
                                  ].toSet().toList(),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 33),
                            child: SvgPicture.asset(
                              'assets/icons/filter.svg',
                              height: 13,
                              colorFilter: const ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Headline(
                      headlineText1: 'See Category', headlineText2: 'view all'),
                  SizedBox(
                    height: 96,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryItem(
                        icon: icons[index],
                        iconName: iconNames[index],
                        isActive: categoryIndex == index,
                        onPressed: () {
                          categoryIndex = index;
                          setState(() {});
                        },
                      ),
                      separatorBuilder: (context, index) => const SizedBox(width: 23),
                      itemCount: icons.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 37, vertical: 35),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 24),
                                child: Icon(Icons.search,
                                    color: AppColors.colorOrange),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11),
                          child: Container(
                            height: 47,
                            width: 47,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: AppColors.colorOrange,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset('assets/icons/web.svg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Headline(
                      headlineText1: 'Hot Sales', headlineText2: 'see more'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: PhoneModelsCarousel(
                        homeStores: phoneModels[0].homeStores),
                  ),
                  const SizedBox(height: 24),
                  const Headline(
                      headlineText1: 'Best Seller', headlineText2: 'see more'),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 227,
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: phoneModels[0].bestSellers.length,
                    itemBuilder: (BuildContext context, int i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'details_page');
                        },
                        child: PhoneCard(
                            bestSeller: phoneModels[0].bestSellers[i]),
                      );
                    },
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class Headline extends StatelessWidget {
  final String headlineText1;
  final String headlineText2;

  const Headline(
      {super.key, required this.headlineText1, required this.headlineText2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, bottom: 24, right: 33),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(headlineText1, style: AppTextStyles.txt25w700),
          const Spacer(),
          Text(headlineText2, style: AppTextStyles.txt15w400orange),
        ],
      ),
    );
  }
}
