import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sif/pages/admin/admin_page.dart';
import 'package:sif/pages/home_page.dart';
import 'package:sif/pages/login_page.dart';
import 'package:sif/pages/otp_page.dart';
import 'package:sif/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sif/firebase_options.dart';
import 'package:sif/provider/auth_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: RegisterPage(),

      ),
    );
  }
}



