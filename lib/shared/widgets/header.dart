import 'package:flutter/material.dart';
import 'package:radio_byte/shared/themes/app_text_style.dart';

import '../themes/app_colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          margin: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            color: AppColors.black,
          ),
          child: Row(
            children: [
              Text('Radio Byte Jr.', style: AppTextStyle.headerTitle),
              SizedBox(width: 5),
              Icon(Icons.radio, color: AppColors.bege),
            ],
          ),
        ),
      ],
    );
  }
}
