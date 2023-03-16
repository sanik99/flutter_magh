import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pod_player/pod_player.dart';
import '../models/movie.dart';
import '../providers/video_provider.dart';




class DetailPage extends StatelessWidget {
final Movie movie;
DetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context, ref,child) {
              final videoData = ref.watch(videoProvider(movie.id));

              return ListView(
                children: [
                  videoData.when(
                  data: (data){
                   return Container(
                       height: 300,
                       child: PlayVideoFromNetwork(videoKey: data,));
                  }, error: (err,s) => Text('$err'),
                      loading: () => Container()
                  )
                ],
              );
            }
    )
    );
  }
}


class PlayVideoFromNetwork extends StatefulWidget {
  final String videoKey;
  const PlayVideoFromNetwork({Key? key, required this.videoKey}) : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/${widget.videoKey}'),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: true,
            isLooping: false,
            videoQualityPriority: [1080, 720]
        ))..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: controller),
    );
  }
}
