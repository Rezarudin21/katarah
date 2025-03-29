import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katarahv2/app/modules/videoplayer/controllers/videoplayer_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart'; // Import untuk mengatur orientasi layar

class VideoPlayerView extends StatefulWidget {
  VideoPlayerView({super.key});

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late YoutubePlayerController _youtubeController;

  // Mengambil controller yang sudah dibuat
  final VideoPlayerController controller = Get.put(VideoPlayerController());

  @override
  void initState() {
    super.initState();

    // Memaksa orientasi layar menjadi landscape
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

    // Menginisialisasi YoutubePlayerController dengan URL video pertama
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(controller.videoUrl.value)!,
      flags: YoutubePlayerFlags(
        autoPlay: true, // Memulai video otomatis
        mute: false, // Tidak dalam keadaan mute
      ),
    );
  }

  @override
  void dispose() {
    // Mengembalikan orientasi layar ke default (portrait) ketika halaman dihancurkan
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Pastikan untuk membuang resource ketika halaman dihancurkan
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Menyembunyikan app bar
        leading: Container(), // Menghilangkan tombol back
      ),
      body: SafeArea(
        child: Center(
          child: YoutubePlayer(
            controller: _youtubeController,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready');
            },
          ),
        ),
      ),
    );
  }
}
