import 'package:bus_app/shared/app_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDownUser extends StatefulWidget {
  const CustomDownUser({super.key});

  @override
  State<CustomDownUser> createState() => _CustomDownState();
}

class _CustomDownState extends State<CustomDownUser> {
  final List<String> items = [
    'Hawally 66',
    'Salmiya 66X',
    'Farwaniya 45',
    'Al Asma 167',
    'Khitan 34',
    'Midan Hawally 44',
    'Al Ardia 187',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Stations ',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        items: items
            .asMap()
            .entries
            .map<DropdownMenuItem<String>>((MapEntry<int, String> entry) {
          return DropdownMenuItem<String>(
            value: entry.value,
            child: Column(
              children: [
                Text(
                  entry.value,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                // Add divider for all items except the last one
                Container(
                  width: double.infinity,
                  child: Divider(
                    color: entry.key != items.length - 1
                        ? AppColors.primeColor
                        : Colors.white,
                    thickness: 1,
                  ),
                ),
              ],
              // if (entry.key !=
              //       items.length -
              //           1)
            ),
          );
        }).toList(),
        onChanged: (String? value) {},
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5), // Circular border
            border: Border.all(color: AppColors.primeColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), // Circular border
            border: Border.all(color: AppColors.primeColor),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
