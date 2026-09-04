import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/theme.dart';

class VoiceChatRoomScreen extends StatefulWidget {
  final String roomId;
  final String roomName;

  const VoiceChatRoomScreen({
    Key? key,
    required this.roomId,
    required this.roomName,
  }) : super(key: key);

  @override
  State<VoiceChatRoomScreen> createState() => _VoiceChatRoomScreenState();
}

class _VoiceChatRoomScreenState extends State<VoiceChatRoomScreen> {
  bool _isMicrophoneOn = true;
  bool _isSpeakerOn = true;
  final List<String> participants = [
    'User 1',
    'User 2',
    'User 3',
    'You',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomName),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Participants Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.w,
                crossAxisSpacing: 8.w,
              ),
              itemCount: participants.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryColor.withOpacity(0.8),
                        AppTheme.secondaryColor.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 32.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        participants[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Speaking',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Control Panel
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Microphone Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMicrophoneOn = !_isMicrophoneOn;
                    });
                  },
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isMicrophoneOn
                          ? AppTheme.primaryColor
                          : Colors.red,
                    ),
                    child: Icon(
                      _isMicrophoneOn ? Icons.mic : Icons.mic_off,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
                // Speaker Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSpeakerOn = !_isSpeakerOn;
                    });
                  },
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isSpeakerOn
                          ? AppTheme.primaryColor
                          : Colors.orange,
                    ),
                    child: Icon(
                      _isSpeakerOn
                          ? Icons.volume_up
                          : Icons.volume_mute,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
                // Leave Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
