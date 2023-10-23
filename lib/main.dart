import 'package:blood_admin/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/home_page.dart';

/// Flutter code sample for [AppBar].

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Snap short:::::::::::${snapshot.data?.uid}");
            //  return const DetailsPage();
            return const HomePage();
          } else {
            //  return const RegisterPage(title: 'Police Report Sign Up');
            return const LoginPage();
          }
        },
      ),
      routes: {
        '/login_page/': (context) => const LoginPage(),
        // '/all_users_page/': (context) => const AllUsersPage(),
        '/home_page/': (context) => const HomePage(),
      },
    );
  }
}
