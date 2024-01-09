import 'dart:math';
import 'package:flutter/material.dart';
import 'package:live_audio_room/module/live_audio_room/view/live_audio_room_view.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import 'module/live_audio_room/config/live_audio_room_config.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final roomIDTextCtrl =
      TextEditingController(text: Random().nextInt(10000).toString());
  final layoutValueNotifier =
      ValueNotifier<LayoutMode>(LayoutMode.defaultLayout);
  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(180, 60),
      foregroundColor: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.6),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID:$localUserID'),
            const Text('Please test with two or more devices'),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Layout : '),
                  switchDropList<LayoutMode>(
                    layoutValueNotifier,
                    [
                      LayoutMode.defaultLayout,
                      LayoutMode.full,
                      LayoutMode.hostTopCenter,
                      LayoutMode.hostCenter,
                      LayoutMode.fourPeoples,
                    ],
                    (LayoutMode layoutMode) {
                      return Text(layoutMode.text);
                    },
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: roomIDTextCtrl,
              decoration: const InputDecoration(labelText: 'join a live by id'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                // ignore: deprecated_member_use
                if (ZegoUIKitPrebuiltLiveAudioRoomMiniOverlayMachine()
                    .isMinimizing) {
                  return;
                }
                jumpToLivePage(
                  context,
                  roomID: roomIDTextCtrl.text.trim(),
                  isHost: true,
                );
              },
              child: const Text('Start a live'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                // ignore: deprecated_member_use
                if (ZegoUIKitPrebuiltLiveAudioRoomMiniOverlayMachine()
                    .isMinimizing) {
                  return;
                }
                jumpToLivePage(
                  context,
                  roomID: roomIDTextCtrl.text.trim(),
                  isHost: false,
                );
              },
              child: const Text('Watch a live'),
            ),
          ],
        ),
      ),
    );
  }

  void jumpToLivePage(BuildContext context,
      {required String roomID, required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LiveAudioRoomView(
          roomID: roomID,
          isHost: isHost,
          layoutMode: layoutValueNotifier.value,
        ),
      ),
    );
  }

  Widget switchDropList<T>(
    ValueNotifier<T> notifier,
    List<T> itemValues,
    Widget Function(T value) widgetBuilder,
  ) {
    return ValueListenableBuilder<T>(
      valueListenable: notifier,
      builder: (context, value, _) {
        return DropdownButton<T>(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: itemValues.map((T itemValue) {
            return DropdownMenuItem(
              value: itemValue,
              child: widgetBuilder(itemValue),
            );
          }).toList(),
          onChanged: (T? newValue) {
            if (newValue != null) {
              notifier.value = newValue;
            }
          },
        );
      },
    );
  }
}
