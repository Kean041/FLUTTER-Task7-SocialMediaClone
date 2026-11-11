import 'package:flutter/material.dart';

import '../model/userpost.dart';
import 'fallback_image.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key, required this.post});

  final Userpost post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0ED),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F0ED),
        title: const Text('Post'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              FallbackImage(
                path: post.userimg,
                width: 42,
                height: 42,
                borderRadius: BorderRadius.circular(21),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.username,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(post.time, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(post.postcontent, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FallbackImage(
              path: post.postimg,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
              fallbackIcon: Icons.image_outlined,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _PostDetailAction(
                icon: post.isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                label: 'Like',
                color: post.isLiked ? Colors.blue : Colors.grey,
              ),
              const _PostDetailAction(
                icon: Icons.mode_comment_outlined,
                label: 'Comment',
              ),
              const _PostDetailAction(
                icon: Icons.share_outlined,
                label: 'Share',
              ),
            ],
          ),
          const Divider(height: 24),
          Text(
            post.numcomments,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          const Text(
            'All Comments',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          for (final comment in post.comments)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FallbackImage(
                    path: comment.commenterImg,
                    width: 34,
                    height: 34,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.commenterName,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(comment.commentContent),
                        const SizedBox(height: 4),
                        Text(
                          comment.commentTime,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _PostDetailAction extends StatelessWidget {
  const _PostDetailAction({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
