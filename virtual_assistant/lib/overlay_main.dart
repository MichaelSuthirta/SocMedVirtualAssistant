import 'package:flutter/material.dart';

void overlayMain() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverlayWidget(),
    ),
  );
}

class OverlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            // aksi klik bubble
          },
          child: Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.mic, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
