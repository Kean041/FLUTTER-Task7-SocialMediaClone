import 'package:flutter/material.dart';

import '../model/userpost.dart';
import '../utils/post_sharing.dart';
import 'fallback_image.dart';
import 'postdetail.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.userposts});

  final List<Userpost> userposts;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void _toggleLike(Userpost post) {
    setState(() => post.isLiked = !post.isLiked);
  }

  Future<void> _sharePost(Userpost post) async {
    try {
      final shared = await sharePost(post);
      if (shared && mounted) {
        setState(() {
          post.numshare = (int.parse(post.numshare) + 1).toString();
        });
      }
    } on Exception catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Unable to share post: $error')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final post = widget.userposts[index];

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              await Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (context) => PostDetailView(post: post),
                ),
              );
              if (mounted) setState(() {});
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
                        onTap: () => _toggleLike(post),
                      ),
                      const _PostAction(
                        icon: Icons.chat_bubble_outline,
                        label: 'Comment',
                      ),
                      _PostAction(
                        icon: Icons.share_outlined,
                        label: 'Share',
                        onTap: () => _sharePost(post),
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
        }, childCount: widget.userposts.length),
      ),
    );
  }
}

class _PostAction extends StatelessWidget {
  const _PostAction({
    required this.icon,
    required this.label,
    this.onTap,
    this.color = Colors.grey,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
