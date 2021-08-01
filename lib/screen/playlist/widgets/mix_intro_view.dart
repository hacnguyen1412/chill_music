import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/login/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MixIntroView extends StatelessWidget {
  final PlaylistResponse playlist;
  const MixIntroView({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Application.size.width,
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  playlist.title ?? "",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  playlist.publisher?.name ?? "",
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
          BouncingButton(
            onTap: () {
              if (context.read<AuthBloc>().isAuthValid) {
                //do something
              } else {
                
              }
            },
            child: Container(
              width: 45,
              height: 45,
              margin: EdgeInsets.only(right: 17),
              child: Center(
                child: Icon(
                  CupertinoIcons.heart,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}