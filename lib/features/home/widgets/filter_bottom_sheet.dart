import 'package:flutter/material.dart';
import 'package:phone_selling_app/utils/app_colors.dart';
import 'package:phone_selling_app/utils/app_text_styles.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet(
      {Key? key, required this.brandList, required this.priceList})
      : super(key: key);
  final List<String> brandList;
  final List<int> priceList;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late String? brand = widget.brandList.first;
  int? price;
  String? size;
  final List<String> phoneSizesList = [
    '3.5 to 4.5 inches',
    '4.5 to 5.5 inches',
    '5.5 to 6.5 inches'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20, left: 44, top: 24, bottom: 20),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorBlue,
                  ),
                  child: Icon(Icons.clear, color: Colors.white, size: 18),
                ),
              ),
              Text('Filter options', style: AppTextStyles.txt18w500),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 86,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorOrange,
                  ),
                  child: Center(
                    child: Text(
                      'Done',
                      style:
                          AppTextStyles.txt18w500.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 10),
          child: Text('Brand', style: AppTextStyles.txt18w500),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          margin: EdgeInsets.symmetric(horizontal: 46),
          height: 37,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorGrey1),
          ),
          child: DropdownButton<String?>(
            underline: SizedBox(),
            isExpanded: true,
            value: brand,
            icon: Icon(Icons.keyboard_arrow_down),
            items: widget.brandList
                .map(
                  (brand) => DropdownMenuItem<String?>(
                    child: Text(brand),
                    value: brand,
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              brand = value!;
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 10),
          child: Text('Price', style: AppTextStyles.txt18w500),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          margin: EdgeInsets.symmetric(horizontal: 46),
          height: 37,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorGrey1),
          ),
          child: DropdownButton<int?>(
            hint: Text('\$${widget.priceList.first.toString()}'),
            underline: SizedBox(),
            isExpanded: true,
            value: price,
            icon: Icon(Icons.keyboard_arrow_down),
            items: widget.priceList
                .map(
                  (price) => DropdownMenuItem<int?>(
                    child: Text("\$${price.toString()}"),
                    value: price,
                  ),
                )
                .toList(),
            onChanged: (int? value) {
              price = value!;
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 10),
          child: Text('Size', style: AppTextStyles.txt18w500),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          margin: EdgeInsets.symmetric(horizontal: 46),
          height: 37,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorGrey1),
          ),
          child: DropdownButton<String?>(
            hint: Text('${phoneSizesList.first}'),
            underline: SizedBox(),
            isExpanded: true,
            value: size,
            icon: Icon(Icons.keyboard_arrow_down),
            items: phoneSizesList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              size = value!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 44),
      ],
    );
  }
}
