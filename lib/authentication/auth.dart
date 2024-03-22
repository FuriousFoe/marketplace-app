import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/Buyer/homepagebuyer.dart';
import 'package:marketplace/Seller/homepageseller.dart';
import 'package:marketplace/onboard.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          final User? user = snapshot.data;
          
          if (user != null && user.email == 'rishabhsingh9861@gmail.com') {
            return const HomeSeller();
          } else {
           
            return const HomeBuyer();
          }
        } else {
          return const Welcome();
        }
      },
    ));
  }
}
