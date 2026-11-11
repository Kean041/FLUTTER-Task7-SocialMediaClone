import 'package:flutter/material.dart';

import '../model/userdata.dart';
import 'fallback_image.dart';

class Mainheader extends StatelessWidget {
  const Mainheader({super.key, required this.userData});

  final Userdata userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FallbackImage(
            path: userData.myUserAccount.img,
            width: 84,
            height: 84,
            borderRadius: BorderRadius.circular(42),
          ),
          const SizedBox(height: 12),
          Text(
            userData.myUserAccount.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E242B),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            userData.myUserAccount.email,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Color(0xFF4A4A4A)),
          ),
        ],
      ),
    );
  }
}
