import 'package:flutter/material.dart';

import 'model/userdata.dart';
import 'views/profile.view.dart';

class Socialmedia extends StatelessWidget {
  const Socialmedia({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileView(userData: Userdata());
  }
}
