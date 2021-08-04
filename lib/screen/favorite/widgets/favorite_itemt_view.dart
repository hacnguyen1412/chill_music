import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteItemView extends StatelessWidget {
  const FavoriteItemView({
    Key? key,
    required PlaylistResponse playlist,
  })  : _playlist = playlist,
        super(key: key);

  final PlaylistResponse _playlist;

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      key: ObjectKey("LibaryItem-${_playlist.id}"),
      onTap: () {
        var _detail =
            context.read<PlayListBloc>().state.playlistDetails?[_playlist.id] ??
                PlaylistDetailResponse();
        context.read<PlayerBloc>().add(
            SwitchPlayerEvent(playlistDetail: _detail, playlist: _playlist));
      },
      child: Container(
        margin: EdgeInsets.only(left: 28, bottom: 25),
        height: 60,
        decoration: BoxDecoration(),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: _playlist.thumbnail ?? "",
                width: 60,
                height: 60,
              ),
            ),
            Container(
              width: Application.size.width - 15 - 60 - 60,
              height: 60,
              padding: const EdgeInsets.only(
                left: 15,
              ),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _playlist.title ?? "",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    _playlist.publisher?.name ?? "publisher",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
