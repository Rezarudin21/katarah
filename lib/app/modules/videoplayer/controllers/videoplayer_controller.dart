import 'package:get/get.dart';

class VideoPlayerController extends GetxController {
  // Rx untuk URL video YouTube yang dapat diubah
  var videoUrl = 'https://www.youtube.com/watch?v=MieBlLblZxQ'.obs;

  // Method untuk mengubah URL video
  void setVideoUrl(String url) {
    videoUrl.value = url;
  }
}
