import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  final String? title;
  const HeaderView({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 26, bottom: 8, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title!,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
