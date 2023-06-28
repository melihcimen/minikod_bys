import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OgrGoruntule extends StatefulWidget {
  final User user;
  const OgrGoruntule({super.key, required this.user});

  @override
  State<OgrGoruntule> createState() => _OgrGoruntuleState();
}

class _OgrGoruntuleState extends State<OgrGoruntule> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
