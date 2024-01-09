import 'package:flutter/material.dart';
import 'package:live_audio_room/core.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import '../view/live_audio_room_view.dart';

class LiveAudioRoomController extends State<LiveAudioRoomView> {
  static late LiveAudioRoomController instance;
  late LiveAudioRoomView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final liveController = ZegoLiveAudioRoomController();
}
