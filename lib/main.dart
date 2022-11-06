import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vrecorder/audio_recorder.dart';

// import 'package:record_example/audio_player.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showPlayer = false;
  String? audioPath;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: showPlayer
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text('Audio Player'),
                  // AudioPlayer(
                  //   source: audioPath!,
                  //   onDelete: () {
                  //     setState(() => showPlayer = false);
                  //   },
                  // ),
                )
              : AudioRecorder(
                  onStop: (path) {
                    if (kDebugMode) print('Recorded file path: $path');
                    setState(() {
                      audioPath = path;
                      showPlayer = true;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
