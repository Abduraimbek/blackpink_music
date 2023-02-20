import 'package:audio_service/audio_service.dart';
import 'package:blackpink_music/utils/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<AudioHandler> initAudioService() async {
  return await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.mycompany.myapp.audio',
      androidNotificationChannelName: AppConstants.appName,
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
}

final audioHandlerProvider = Provider<AudioHandler>((ref) {
  throw 'Unimplemented Error';
});

class MyAudioHandler extends BaseAudioHandler {}
