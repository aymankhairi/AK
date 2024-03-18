import 'package:alaraaf/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedIconWallet;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final String text;
  final TextEditingController mycontroller;
  const CustomAppBar(
      {super.key,
      required this.titleappbar,
      this.onPressedIcon,
      this.onPressedSearch,
      required this.onPressedIconFavorite,
      this.onChanged,
      required this.mycontroller,
      required this.onPressedIconWallet,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPressedSearch, icon: const Icon(Icons.search)),
                hintText: titleappbar,
                hintStyle: const TextStyle(
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            width: 40,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            child: IconButton(
                onPressed: onPressedIcon,
                icon: Icon(
                  Icons.notifications_active_outlined,
                  size: 25,
                  color: Colors.grey[700],
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            width: 40,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: Icon(
                  Icons.favorite_outline,
                  size: 25,
                  color: Colors.grey[700],
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            width: 70,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(color: AppColor.black, fontSize: 20),
                ),
                IconButton(
                    onPressed: onPressedIconWallet,
                    icon: Icon(
                      Icons.monetization_on,
                      size: 25,
                      color: Colors.grey[700],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
