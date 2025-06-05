import 'package:flutter/material.dart';

class OverlayContent extends StatelessWidget {
  static entryPoint() {
    // Your overlay UI or logic here
    print("Overlay service started");
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.mic, color: Colors.white),
        ),
      ),
    );
  }
}
