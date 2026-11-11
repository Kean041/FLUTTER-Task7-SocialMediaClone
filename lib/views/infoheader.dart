import 'package:flutter/material.dart';

import '../model/userdata.dart';

class Infoheader extends StatelessWidget {
  const Infoheader({super.key, required this.userData});

  final Userdata userData;

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('Followers', userData.myUserAccount.numFollowers),
      ('Following', userData.myUserAccount.numFollowing),
      ('Posts', userData.myUserAccount.numPosts),
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: stats
            .map(
              (item) => Expanded(
                child: Column(
                  children: [
                    Text(
                      item.$1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                    const SizedBox(height: 6),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        item.$2,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F2128),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
