import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/loader.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final int movieId;
  const VideoPlayer({super.key, required this.movieId});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    super.initState();
    context.read<TrailerBloc>().add(TrailerLoaded(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrailerBloc, TrailerState>(
      builder: (context, state) {
        if (state is TrailerLoading) {
          return const SizedBox(height: 200, child: Loader());
        } else if (state is TrailerFailure) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is TrailerSuccess) {
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: state.controller,
              showVideoProgressIndicator: true,
            ),
            builder: (p0, p1) {
              return p1;
            },
          );
        }
        return Container();
      },
    );
  }
}
