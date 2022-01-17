import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ornek_proje/common/repository/app_repository.dart';
import 'package:ornek_proje/core/navigation/navigation_route.dart';
import 'package:ornek_proje/core/navigation/navigation_service.dart';
import 'get_it.dart';
import 'ui/auth/landing/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getItSetup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final AppRepository appRepository = getIt<AppRepository>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Yarışma',
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          theme: ThemeData.dark(),
          home: const LandingPage(),
          navigatorKey: NavigationService.instance.navigatorKey,
        );
      },
    );
  }
}
