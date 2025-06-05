import 'package:flutter/material.dart';
import 'app_menu_handler/UI_handler/toggle_switch.dart';
import 'app_menu_handler/UI_handler/record_button.dart';
import 'app_menu_handler/UI_handler/text_transcript_displayer.dart';
import 'package:virtual_assistant/voice_input_processor/vosk_handler.dart';
import 'overlay_main.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'app_menu_handler/UI_handler/overlay_content.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  Future<void> _startOverlay() async {
    if (!await FlutterOverlayWindow.isPermissionGranted()) {
      await FlutterOverlayWindow.requestPermission();
    }
    await FlutterOverlayWindow.showOverlay(
      height: WindowSize.fullCover,
      width: WindowSize.fullCover,
      alignment: OverlayAlignment.centerRight,
      overlayTitle: "AssistiveTouch",
      flag: OverlayFlag.defaultFlag,
      enableDrag: true,
      overlayContent: OverlayContent.entryPoint(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Start Overlay"),
            onPressed: _startOverlay,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Top part of application
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Virtual Assistant'),
      ),

      body: Padding( //Gives padding so that content has space from screen edge
        padding: const EdgeInsets.all(20),
        child:
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //Space between text and button
              children: [
                Text("Activate overlay"),
                ToggleSwitch() //Switch button
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Refresh overlay"), //No functionality yet, just placeholder
              ],
            ),
            const RecordButton(), //Recording button
            AudioInputDisplayer(key: AudioInputDisplayer.globalKey), //Transcript display area

          ],
        ),
      ),
    );
  }
}
