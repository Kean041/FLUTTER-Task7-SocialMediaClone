import 'package:flutter/material.dart';

import '../model/friend.dart';
import 'fallback_image.dart';

class Friendlist extends StatelessWidget {
  const Friendlist({
    super.key,
    required this.friendList,
    required this.numFriends,
  });

  final List<Friend> friendList;
  final String numFriends;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Friends',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E242B),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                numFriends,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4F4F4F),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.76,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: friendList.length,
            itemBuilder: (context, index) {
              final friend = friendList[index];
              return Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: FallbackImage(
                      path: friend.img,
                      width: double.infinity,
                      height: double.infinity,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    friend.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
