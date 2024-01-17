// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:live_audio_room/core.dart';
import 'package:live_audio_room/module/live_audio_room/widget/gift_widget.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

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

  Future<void> _sendGift() async {
    try {
      final dio = Dio();
      final response = await dio.post(
        'https://zego-example-server-nextjs.vercel.app/api/send_gift',
        data: {
          'app_id': yourAppID,
          'server_secret': yourServerSecret,
          'room_id': widget.roomID,
          'user_id': localUserID,
          'user_name': 'user_$localUserID',
          'gift_type': 1001,
          'gift_count': 1,
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        // Ketika pemberi hadiah berhasil memanggil antarmuka hadiah,
        // animasi hadiah dapat mulai ditampilkan
        GiftWidget.show(context, "assets/sports-car.svga");
      }
    } catch (error) {
      debugPrint("[ERROR], store fcm token exception, ${error.toString()}");
    }
  }
}
