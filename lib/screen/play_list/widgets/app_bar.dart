import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter/material.dart';

class PlayListAppBar extends StatelessWidget {
  final PlaylistResponse? playlist;
  const PlayListAppBar({
    Key? key,
    required this.isPinned,
    this.playlist,
  }) : super(key: key);

  final bool isPinned;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: isPinned
          ? playlist?.color.mix(Colors.black, 0.3)
          : Colors.transparent,
      shadowColor: Colors.transparent,
      expandedHeight:
          Application.size.width! + Application.size.statusBar! - 20,
      stretch: true,
      pinned: true,
      floating: false,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            "Rain & Chill",
            style: TextStyle(
                color: isPinned ? Colors.white : Colors.transparent,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          background: Column(
            children: [
              SizedBox(
                height: Application.size.appBar,
              ),
              Container(
                width: Application.size.width! - 100,
                height: Application.size.width! - 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 20,
                      spreadRadius: 5,
                      color: playlist!.color.withOpacity(0.23),
                    ),
                  ],
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Hero(
                    tag: playlist?.thumbnail ?? "",
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(seconds: 0),
                      imageUrl: playlist?.thumbnail ?? "",
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}