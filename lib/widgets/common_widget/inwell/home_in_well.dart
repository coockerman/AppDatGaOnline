// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class HomeInWell extends StatelessWidget {
  final String image;
  final String text;
  const HomeInWell({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Chỉnh góc bo tròn
            border: Border.all(
                color: Colors.white, width: 2), // Đường viền của container
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                8), // Đảm bảo ảnh cũng có góc bo tròn như container
            child: Image.asset(
              image,
              fit: BoxFit.cover, // Làm ảnh fill toàn bộ container
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xfff32343e),
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        )
      ],
    );
  }
}
