import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:package_login/core/constrants/localVariable.dart';
import 'package:package_login/core/gen/assets.gen.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = '/LoadingPage';

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.assset.animations.loading,
          width: 150,
          fit: BoxFit.fill,
          package: LocalVariable.packageName,
        ),
      ),
    );
  }
}
