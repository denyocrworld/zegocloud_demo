import 'package:live_audio_room/core.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ZegoUIKit().initLog().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      home: HomePage(),
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            child!,
            ZegoUIKitPrebuiltLiveAudioRoomMiniOverlayPage(
              contextQuery: () {
                return Get.navigatorKey.currentState!.context;
              },
            ),
          ],
        );
      },
    );
  }
}
