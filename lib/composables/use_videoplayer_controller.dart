import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController useVideoPlayerController(String url) {
  final _isInitialized = useState(false);
  final _controller = useState<VideoPlayerController?>(null);

  useEffect(() {
    final controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..setLooping(false)
      ..initialize().then((_) {
        _isInitialized.value = true;
      });

    controller.addListener(() {
      if (controller.value.position >= controller.value.duration) {
        controller.seekTo(Duration.zero);
        controller.pause();
      }
    });

    _controller.value = controller;

    return () {
      controller.dispose();
    };
  }, [url]);

  return _controller.value!;
}
