import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:package_login/core/initialize/global_binding.dart';
import 'package:package_login/core/routers/router_configs.dart';
import 'package:package_login/package_login.dart';

void _initUserPackage() {
  CoreUserPackage.init(
    urlAPI: '',
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initUserPackage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Phan anh',
      getPages: RouterConfigs.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      enableLog: true,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("login"),
                onPressed: () => CoreUserPackage.goLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
