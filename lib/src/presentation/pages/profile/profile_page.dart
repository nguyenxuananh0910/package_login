import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/profile/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  static const String routeName = '/ProfilePage';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Text('Profile'),
    );
  }
}
