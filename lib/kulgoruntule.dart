import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KullaniciGoruntule extends StatefulWidget {
  final User user;
  const KullaniciGoruntule({super.key, required this.user});

  @override
  State<KullaniciGoruntule> createState() => _KullaniciGoruntuleState();
}

class _KullaniciGoruntuleState extends State<KullaniciGoruntule> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
