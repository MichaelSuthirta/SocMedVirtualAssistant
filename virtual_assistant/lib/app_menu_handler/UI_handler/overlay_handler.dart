import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:flutter/services.dart';

class OverlayHandler {
  static const platform = MethodChannel('overlay_channel');
  static Future<void> showBubble() async {
    try {
      await platform.invokeMethod('showBubble');
    } on PlatformException catch (e) {
      print("Failed to show bubble: '${e.message}'.");
    }
  }
  static Future<void> showFloatingButton() async {
    final isGranted = await FlutterOverlayWindow.isPermissionGranted();

    if (!isGranted) {
      await FlutterOverlayWindow.requestPermission();
    }

    final granted = await FlutterOverlayWindow.isPermissionGranted();
    if (granted) {
      await FlutterOverlayWindow.showOverlay(
        height: 200,
        width: 200,
        alignment: OverlayAlignment.centerRight,
        flag: OverlayFlag.defaultFlag,
        enableDrag: true,
      );
    } else {
      print("Overlay permission not granted.");
    }
  }

  static Future<void> closeFloatingButton() async {
    await FlutterOverlayWindow.closeOverlay();
  }
}
