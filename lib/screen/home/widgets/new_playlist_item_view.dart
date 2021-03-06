import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPlaylistItemView extends StatefulWidget {
  final PlaylistResponse playlist;
  const NewPlaylistItemView({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  _NewPlaylistItemViewState createState() =>
      _NewPlaylistItemViewState(playlist);
}

class _NewPlaylistItemViewState extends State<NewPlaylistItemView> {
  final PlaylistResponse playlist;
  _NewPlaylistItemViewState(this.playlist);

  @override
  void initState() {
    context.read<PlayListBloc>().add(FetchPlaylistContent(playlist.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: () {
        context.read<PlayerBloc>().add(
              SwitchPlayerEvent(
                playlistDetail: context
                        .read<PlayListBloc>()
                        .state
                        .playlistDetails?[playlist.id] ??
                    PlaylistDetailResponse(),
                playlist: playlist,
              ),
            );
        // AppNavigator.push(
        //   context,
        //   GradientBackgroundView(
        //     colors: [
        //       playlist.color,
        //       Application.colors.backgroundColor.withAlpha(50),
        //       Application.colors.backgroundColor,
        //     ],
        //     contentView: PlaylistScreen(
        //       playlist: playlist,
        //       heroTag: playlist.thumbnail,
        //     ),
        //   ),
        // );
      },
      child: Container(
        width: (Application.size.width - 28 * 3) / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: (Application.size.width - 28 * 3) / 2,
              height: (Application.size.width - 28 * 3) / 2,
              decoration: BoxDecoration(
                color: Application.colors.darkGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: playlist.thumbnail!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              playlist.title ?? "Title",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            // SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   playlist.publisher?.name ?? "Author",
            //   style: TextStyle(fontWeight: FontWeight.w200),
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            // ),
          ],
        ),
      ),
    );
  }
}

class ShimmerPlaylistItemView extends StatelessWidget {
  const ShimmerPlaylistItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Application.size.width - 28 * 3) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: (Application.size.width - 28 * 3) / 2,
            height: (Application.size.width - 28 * 3) / 2,
            decoration: BoxDecoration(
              color: Application.colors.darkGrey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: (Application.size.width - 28 * 3) / 2,
            height: 20,
            decoration: BoxDecoration(
              color: Application.colors.darkGrey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
