import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  ShadowContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 4,
            blurRadius: 12,
          ),
        ],
      ),
      child: child,
    );
  }
}
