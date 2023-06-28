import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YoklamaGir extends StatefulWidget {
  final User user;
  const YoklamaGir({super.key, required this.user});

  @override
  State<YoklamaGir> createState() => _YoklamaGirState();
}

class _YoklamaGirState extends State<YoklamaGir> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
