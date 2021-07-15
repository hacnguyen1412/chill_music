import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/home/widgets/mini_song_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayListBody extends StatelessWidget {
  const PlayListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Application.size.height! - Application.size.appBar!,
      color: Application.colors.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              width: Application.size.width,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 11),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/icons/launcher_icon.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 53,
                    bottom: 18,
                    child: Text(
                      "Chill Music",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 16,
                    child: Text(
                      "6.167.030 lượt thích",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    right: 16,
                    child: Icon(
                      CupertinoIcons.heart,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MiniSongView(),
            MiniSongView(),
            MiniSongView(),
          ],
        ),
      ),
    );
  }
}