import 'package:live_audio_room/module/live_audio_room/controller/live_audio_room_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:live_audio_room/core.dart';
import 'package:live_audio_room/module/live_audio_room/widget/info_container.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

class LiveAudioRoomView extends StatefulWidget {
  final String roomID;
  final bool isHost;
  final LayoutMode layoutMode;

  const LiveAudioRoomView({
    super.key,
    required this.roomID,
    this.layoutMode = LayoutMode.defaultLayout,
    this.isHost = false,
  });

  Widget build(context, LiveAudioRoomController controller) {
    controller.view = this;

    Widget foreground(BoxConstraints constraints) {
      return Stack(
        children: [
          //GIFT BUTTON AND PANEL
          Positioned(
            left: 56,
            bottom: 14,
            child: CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.white,
              child: InkWell(
                onTap: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Material(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(
                                    24.0,
                                  ),
                                  topRight: Radius.circular(
                                    24.0,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          size: 24.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      const Icon(
                                        Icons.circle,
                                        size: 24.0,
                                        color: Color(0xfff0ba30),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      const Text(
                                        "120",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 38,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xfff0ba30),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            "Buy Coin",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: List.generate(
                                      6,
                                      (index) {
                                        bool selected = index == 0;
                                        return Expanded(
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.developer_board,
                                                size: 28.0,
                                                color: selected
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.6),
                                              ),
                                              Text(
                                                "Menu1",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: selected
                                                      ? Colors.white
                                                      : Colors.white
                                                          .withOpacity(0.6),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.0,
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 6,
                                      crossAxisSpacing: 6,
                                    ),
                                    itemCount: 12,
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        child: Column(
                                          children: [
                                            Icon(
                                              MdiIcons.gift,
                                              size: 22.0,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  MdiIcons.circle,
                                                  size: 12.0,
                                                  color:
                                                      const Color(0xfff0ba30),
                                                ),
                                                const SizedBox(
                                                  width: 2.0,
                                                ),
                                                Text(
                                                  "${(index + 1) * 10}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  MdiIcons.gift,
                  color: const Color(0xff5e5e5e),
                  size: 18.0,
                ),
              ),
            ),
          ),
        ],
      );

      // return simpleMediaPlayer(
      //   canControl: isHost,
      //   liveController: controller.liveController,
      // );

      // return advanceMediaPlayer(
      //   constraints: constraints,
      //   canControl: isHost,
      // );
    }

    Widget background() {
      /// how to replace background view
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                // image: Image.asset('assets/images/background.png').image,
                image: Image.network(
                        'https://w0.peakpx.com/wallpaper/86/903/HD-wallpaper-winter-night-starry-stars.jpg')
                    .image,
              ),
            ),
          ),
          const Positioned(
            top: 10,
            left: 10,
            child: Row(
              children: [
                InfoContainer(
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 12.0,
                        color: Color(0xfff0ba30),
                      ),
                      Text(
                        "18",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
                InfoContainer(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 12.0,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/PGv8ZzG/me.jpg",
                        ),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Andrea",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Room name",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 12,
            top: 12,
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 12.0,
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Text(
                        "25k",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 4.0,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 12.0,
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Text(
                        "21k",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 4.0,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 12.0,
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Text(
                        "15k",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8.0,
                ),
                InfoContainer(
                  child: Row(
                    children: [
                      Icon(
                        Icons.visibility,
                        size: 12.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "136",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: 10 + 20,
          //   left: 10,
          //   child: Text(
          //     'ID: $roomID',
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //       color: Color(0xff606060),
          //       fontSize: 12,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // )
        ],
      );
    }

    ZegoLiveAudioRoomSeatConfig getSeatConfig() {
      if (layoutMode == LayoutMode.hostTopCenter) {
        return ZegoLiveAudioRoomSeatConfig(
          backgroundBuilder: (
            BuildContext context,
            Size size,
            ZegoUIKitUser? user,
            Map<String, dynamic> extraInfo,
          ) {
            return Container(color: Colors.grey);
          },
        );
      }

      return ZegoLiveAudioRoomSeatConfig(
          // avatarBuilder: avatarBuilder,
          );
    }

    // ignore: unused_element
    Widget avatarBuilder(
      BuildContext context,
      Size size,
      ZegoUIKitUser? user,
      Map<String, dynamic> extraInfo,
    ) {
      return CircleAvatar(
        maxRadius: size.width,
        backgroundImage: Image.asset(
                "assets/avatars/avatar_${((int.tryParse(user?.id ?? "") ?? 0) % 6).toString()}.png")
            .image,
      );
    }

    int getHostSeatIndex() {
      if (layoutMode == LayoutMode.hostCenter) {
        return 4;
      }

      return 0;
    }

    List<int> getLockSeatIndex() {
      if (layoutMode == LayoutMode.hostCenter) {
        return [4];
      }

      return [0];
    }

    ZegoLiveAudioRoomLayoutConfig getLayoutConfig() {
      final config = ZegoLiveAudioRoomLayoutConfig();
      switch (layoutMode) {
        case LayoutMode.defaultLayout:
          break;
        case LayoutMode.full:
          config.rowSpacing = 5;
          config.rowConfigs = [
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 4,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 4,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 4,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 4,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
          ];
          break;
        case LayoutMode.hostTopCenter:
          config.rowConfigs = [
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 1,
              alignment: ZegoLiveAudioRoomLayoutAlignment.center,
            ),
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 3,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 3,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 2,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceEvenly,
            ),
          ];
          break;
        case LayoutMode.hostCenter:
          config.rowSpacing = 5;
          config.rowConfigs = [
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 3,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 3,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 3,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
          ];
          break;
        case LayoutMode.fourPeoples:
          config.rowConfigs = [
            ZegoLiveAudioRoomLayoutRowConfig(
              count: 4,
              alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
            ),
          ];
          break;
      }
      return config;
    }

    void onMemberListMoreButtonPressed(ZegoUIKitUser user) {
      showModalBottomSheet(
        backgroundColor: const Color(0xff111014),
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        isDismissible: true,
        isScrollControlled: true,
        builder: (BuildContext context) {
          TextStyle textStyle = const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          );
          final listMenu = controller.liveController.localHasHostPermissions
              ? [
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context).pop();

                      ZegoUIKit().removeUserFromRoom(
                        [user.id],
                      ).then((result) {
                        debugPrint('kick out result:$result');
                      });
                    },
                    child: Text(
                      'Kick Out ${user.name}',
                      style: textStyle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context).pop();

                      controller.liveController
                          .inviteAudienceToTakeSeat(user.id)
                          .then((result) {
                        debugPrint(
                            'invite audience to take seat result:$result');
                      });
                    },
                    child: Text(
                      'Invite ${user.name} to take seat',
                      style: textStyle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: textStyle,
                    ),
                  ),
                ]
              : [];
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 50),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listMenu.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 60,
                    child: Center(child: listMenu[index]),
                  );
                },
              ),
            ),
          );
        },
      );
    }

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ZegoUIKitPrebuiltLiveAudioRoom(
            appID: yourAppID /*input your AppID*/,
            appSign: yourAppSign /*input your AppSign*/,
            userID: localUserID,
            userName: 'user_$localUserID',
            roomID: roomID,
            controller: controller.liveController,
            config: (isHost
                ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
                : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience())
              ..takeSeatIndexWhenJoining = isHost ? getHostSeatIndex() : -1
              ..hostSeatIndexes = getLockSeatIndex()
              ..layoutConfig = getLayoutConfig()
              ..seatConfig = getSeatConfig()
              ..background = background()
              ..foreground = foreground(constraints)
              ..topMenuBarConfig.buttons = [
                // ZegoMenuBarButtonName.minimizingButton,
                // ZegoMenuBarButtonName.leaveButton,
              ]
              ..bottomMenuBarConfig.hostButtons = [
                ZegoMenuBarButtonName.soundEffectButton,
                ZegoMenuBarButtonName.toggleMicrophoneButton,
                ZegoMenuBarButtonName.showMemberListButton,
                ZegoMenuBarButtonName.closeSeatButton,
              ]
              ..userAvatarUrl = 'https://robohash.org/$localUserID.png'
              ..onUserCountOrPropertyChanged = (List<ZegoUIKitUser> users) {
                debugPrint(
                    'onUserCountOrPropertyChanged:${users.map((e) => e.toString())}');
              }
              ..onSeatClosed = () {
                debugPrint('on seat closed');
              }
              ..onSeatsOpened = () {
                debugPrint('on seat opened');
              }
              ..onSeatsChanged = (
                Map<int, ZegoUIKitUser> takenSeats,
                List<int> untakenSeats,
              ) {
                debugPrint(
                    'on seats changed, taken seats:$takenSeats, untaken seats:$untakenSeats');
              }
              ..onSeatTakingRequested = (ZegoUIKitUser audience) {
                debugPrint('on seat taking requested, audience:$audience');
              }
              ..onSeatTakingRequestCanceled = (ZegoUIKitUser audience) {
                debugPrint(
                    'on seat taking request canceled, audience:$audience');
              }
              ..onInviteAudienceToTakeSeatFailed = () {
                debugPrint('on invite audience to take seat failed');
              }
              ..onSeatTakingInviteRejected = () {
                debugPrint('on seat taking invite rejected');
              }
              ..onSeatTakingRequestFailed = () {
                debugPrint('on seat taking request failed');
              }
              ..onSeatTakingRequestRejected = () {
                debugPrint('on seat taking request rejected');
              }
              ..onHostSeatTakingInviteSent = () {
                debugPrint('on host seat taking invite sent');
              }

              /// WARNING: will override prebuilt logic
              // ..onSeatClicked = (int index, ZegoUIKitUser? user) {
              //   debugPrint(
              //       'on seat clicked, index:$index, user:${user.toString()}');
              // }

              /// WARNING: will override prebuilt logic
              ..onMemberListMoreButtonPressed = onMemberListMoreButtonPressed,
          );
        },
      ),
    );
  }

  @override
  State<LiveAudioRoomView> createState() => LiveAudioRoomController();
}
