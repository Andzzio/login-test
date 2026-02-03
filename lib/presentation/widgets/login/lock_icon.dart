import 'package:flutter/material.dart';

class LockIcon extends StatelessWidget {
  const LockIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1983EE), Color(0xFF459FFD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.7],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFC4DCF3),
              blurRadius: 20,
              offset: Offset(0, 6),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.lock, color: Colors.white, size: 40),
      ),
    );
  }
}
