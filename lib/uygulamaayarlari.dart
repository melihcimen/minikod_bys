import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UygulamaAyar extends StatefulWidget {
  final User user;
  const UygulamaAyar({super.key, required this.user});

  @override
  State<UygulamaAyar> createState() => _UygulamaAyarState();
}

class _UygulamaAyarState extends State<UygulamaAyar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7931E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF93278F),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: const Text(
          'Uygulama Ayarları',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
