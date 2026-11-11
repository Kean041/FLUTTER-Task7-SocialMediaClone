import 'package:share_plus/share_plus.dart';

import '../model/userpost.dart';

Future<bool> sharePost(Userpost post) async {
  final result = await SharePlus.instance.share(
    ShareParams(text: '${post.username}: ${post.postcontent}'),
  );
  return result.status == ShareResultStatus.success;
}
