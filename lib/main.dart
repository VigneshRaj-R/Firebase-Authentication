import 'package:firebase_authentication/view/widgets/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/provider/auth_provider.dart';
import 'controller/provider/login.dart';
import 'controller/provider/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LogInProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
