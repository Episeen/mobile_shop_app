import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone_selling_app/features/phone_details/bloc/details_bloc.dart';
import 'package:phone_selling_app/features/phone_details/widgets/phone_details_swiper.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../widgets/details_section_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late final DetailsBloc bloc = context.read<DetailsBloc>();
  bool likeToggle = true;
  bool colorToggle = true;
  bool memoryToggle = true;

  @override
  void initState() {
    bloc.add(const DetailsEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) =>
                    const Center(child: Text('Error fetching data')),
                loaded: (phoneDetails) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, left: 44, top: 79),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 37,
                                height: 37,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.colorBlue,
                                ),
                                child: const Center(
                                  child: Icon(Icons.arrow_back_ios,
                                      color: Colors.white, size: 18),
                                ),
                              ),
                            ),
                            const Text('Product Details',
                                style: AppTextStyles.txt18w500),
                            const SizedBox(width: 9),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'cart_page');
                              },
                              child: Container(
                                width: 37,
                                height: 37,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.colorOrange,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/shopping_cart.svg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 37),
                      PhoneDetailsSwiper(phoneImages: phoneDetails.image),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 28, left: 35, right: 34),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(phoneDetails.title,
                                          style: AppTextStyles.txt22w500),
                                      Container(
                                        width: 37,
                                        height: 37,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.colorBlue,
                                        ),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              likeToggle = !likeToggle;
                                              setState(() {});
                                            },
                                            child: likeToggle
                                                ? const Icon(
                                                    Icons.favorite_border_sharp,
                                                    color: Colors.white,
                                                    size: 22)
                                                : const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                    size: 22,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 7, left: 35, right: 34),
                                child: Row(
                                  children: [
                                    Icon(Icons.star_rate,
                                        color: Colors.amberAccent),
                                    SizedBox(width: 7),
                                    Icon(Icons.star_rate,
                                        color: Colors.amberAccent),
                                    SizedBox(width: 7),
                                    Icon(Icons.star_rate,
                                        color: Colors.amberAccent),
                                    SizedBox(width: 7),
                                    Icon(Icons.star_rate,
                                        color: Colors.amberAccent),
                                    SizedBox(width: 7),
                                    Icon(Icons.star_rate,
                                        color: Colors.amberAccent),
                                  ],
                                ),
                              ),
                              TabBar(
                                indicatorColor: AppColors.colorOrange,
                                indicatorWeight: 3,
                                tabs: [
                                  Tab(
                                      child: Text(
                                    'Details',
                                    style: AppTextStyles.txt20w700
                                        .copyWith(color: Colors.black),
                                  )),
                                  Tab(
                                      child: Text(
                                    'Shop',
                                    style: AppTextStyles.txt20w700
                                        .copyWith(color: Colors.black),
                                  )),
                                  Tab(
                                      child: Text(
                                    'Features',
                                    style: AppTextStyles.txt20w700
                                        .copyWith(color: Colors.black),
                                  )),
                                ],
                              ),
                              Container(
                                height: 85,
                                child: TabBarView(children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 33, left: 35, right: 34),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DetailsSection(
                                          svgPicture:
                                              'assets/icons/processor.svg',
                                          text: 'Exynos 990',
                                        ),
                                        DetailsSection(
                                          svgPicture: 'assets/icons/camera.svg',
                                          text: '108 + 12 mp',
                                        ),
                                        DetailsSection(
                                          svgPicture:
                                              'assets/icons/internal_memory.svg',
                                          text: '8 GB',
                                        ),
                                        DetailsSection(
                                          svgPicture:
                                              'assets/icons/external_memory.svg',
                                          text: '256 GB',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      child: const Center(
                                          child: Text(
                                    'No information provided',
                                  ))),
                                  Container(
                                      child: const Center(
                                          child: Text(
                                    'No features provided',
                                  ))),
                                ]),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 18, left: 35),
                                child: Text('Select color and capacity',
                                    style: AppTextStyles.txt16w500),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 14, left: 35),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        colorToggle = !colorToggle;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 39,
                                        width: 39,
                                        margin:
                                            const EdgeInsets.only(right: 19),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(33),
                                          color: Colors.brown,
                                          // color: Color( (phoneDetails.color[0].substring(1))),
                                        ),
                                        child: colorToggle
                                            ? Icon(Icons.done_outlined,
                                                color: Colors.white, size: 25)
                                            : null,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        colorToggle = !colorToggle;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 39,
                                        width: 39,
                                        margin:
                                            const EdgeInsets.only(right: 19),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(33),
                                          color: Colors.black,
                                        ),
                                        child: !colorToggle
                                            ? Icon(Icons.done_outlined,
                                                color: Colors.white, size: 25)
                                            : null,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        memoryToggle = !memoryToggle;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 71,
                                        margin: const EdgeInsets.only(
                                            right: 19, left: 29),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: memoryToggle
                                              ? AppColors.colorOrange
                                              : Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            phoneDetails.capacity[0],
                                            style: AppTextStyles.txt13w700
                                                .copyWith(
                                              color: memoryToggle
                                                  ? Colors.white
                                                  : AppColors.colorGreyDark,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        memoryToggle = !memoryToggle;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 71,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: !memoryToggle
                                              ? AppColors.colorOrange
                                              : Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            phoneDetails.capacity[1],
                                            style: AppTextStyles.txt13w700
                                                .copyWith(
                                              color: !memoryToggle
                                                  ? Colors.white
                                                  : AppColors.colorGreyDark,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   height: 54,
                              //   width: 355,
                              //   margin: const EdgeInsets.only(
                              //       left: 35, right: 35, top: 27, bottom: 20),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: AppColors.colorOrange,
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.only(left: 40),
                              //         child: Text('Add to cart',
                              //             style: AppTextStyles.txt20w700
                              //                 .copyWith(color: Colors.white)),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.only(right: 40),
                              //         child: Text(
                              //           '\$${phoneDetails.price}',
                              //           style: AppTextStyles.txt20w700.copyWith(
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40),
                                          child: Text('Add to cart'),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$${phoneDetails.price}',
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
