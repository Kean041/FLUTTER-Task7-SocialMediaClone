import 'package:flutter/material.dart';

import '../model/userpost.dart';
import 'fallback_image.dart';
import 'postdetail.dart';

class PostList extends StatelessWidget {
  const PostList({super.key, required this.userposts});

  final List<Userpost> userposts;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final post = userposts[index];

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => PostDetailView(post: post),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FallbackImage(
                        path: post.userimg,
                        width: 36,
                        height: 36,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              post.time,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(post.postcontent, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FallbackImage(
                      path: post.postimg,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                      fallbackIcon: Icons.image_outlined,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _PostAction(
                        icon: post.isLiked
                            ? Icons.thumb_up
                            : Icons.thumb_up_outlined,
                        label: 'Like',
                        color: post.isLiked ? Colors.blue : Colors.grey,
                      ),
                      const _PostAction(
                        icon: Icons.chat_bubble_outline,
                        label: 'Comment',
                      ),
                      const _PostAction(
                        icon: Icons.share_outlined,
                        label: 'Share',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${post.numcomments} Comments',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '${post.numshare} Shares',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }, childCount: userposts.length),
      ),
    );
  }
}

class _PostAction extends StatelessWidget {
  const _PostAction({
    required this.icon,
    required this.label,
    this.color = Colors.grey,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 4),
          Text(label),
        ],
      ),
    );
  }
}
