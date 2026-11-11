import 'package:flutter/material.dart';

import '../model/userdata.dart';
import 'friendlist.dart';
import 'infoheader.dart';
import 'mainheader.dart';
import 'postlist.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.userData});

  final Userdata userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0ED),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      tooltip: 'Return',
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                  Mainheader(userData: userData),
                  Infoheader(userData: userData),
                  Friendlist(
                    friendList: userData.friendList,
                    numFriends: userData.myUserAccount.numFriends,
                  ),
                ]),
              ),
            ),
            PostList(userposts: userData.userList),
          ],
        ),
      ),
    );
  }
}
