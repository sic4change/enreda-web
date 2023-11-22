import 'package:enreda_app/models/trainingPill.dart';
import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/resources/sections/show_alert_user_anonimous.dart';
import 'package:enreda_app/presentation/pages/trainingPills/build_share_training_pill.dart';
import 'package:enreda_app/presentation/pages/trainingPills/pages/meta_data_section.dart';
import 'package:enreda_app/presentation/pages/trainingPills/pages/play_pause_button.dart';
import 'package:enreda_app/presentation/pages/trainingPills/pages/video_position_seeker.dart';
import 'package:enreda_app/presentation/pages/trainingPills/videos_tooltip_widget/video_thumbnail_area.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/const.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrainingPillsListTileMobile extends StatefulWidget {
  const TrainingPillsListTileMobile({Key? key, required this.trainingPill})
      : super(key: key);
  final TrainingPill trainingPill;

  @override
  State<TrainingPillsListTileMobile> createState() => _TrainingPillsListTileMobileState();
}

class _TrainingPillsListTileMobileState extends State<TrainingPillsListTileMobile> {
  late YoutubePlayerController _controller;
  bool _isVideoVisible = false;
  late String urlYoutubeVideo;
  late String idYoutubeVideo;

  @override
  void initState() {
    super.initState();
    urlYoutubeVideo = widget.trainingPill.urlVideo;
    idYoutubeVideo = YoutubePlayerController.convertUrlToId(urlYoutubeVideo) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        if (!_isVideoVisible) Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 8.0),
                    child: videoThumbnailArea(idYoutubeVideo)),
                videoDescription(Constants.lilac, AppColors.greyTxtAlt),
              ]
          ),
        ),
        if(_isVideoVisible) YoutubePlayerControllerProvider(
          controller: _controller,
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
                      width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: playVideoArea())),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          icon: const Icon(Icons.close),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              _isVideoVisible = !_isVideoVisible;
                            });
                          }
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        widget.trainingPill.trainingPillCategoryName!.toUpperCase(),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: textTheme.titleSmall?.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.normal,
                          fontSize:  13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SpaceH2(),
                    MetaDataSection(),
                    VideoPositionSeeker(),
                    PlayPauseButtonBar(),
                  ],
                ),

              ],
            ),
          ),
        )
      ],
    );
  }

  Widget videoDescription(Color? colorTitle, Color? colorText) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 12, 13, md: 12);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.trainingPill.trainingPillCategoryName!.toUpperCase(),
            textAlign: TextAlign.left,
            maxLines: 1,
            style: textTheme.titleSmall?.copyWith(
              height: 1.5,
              fontWeight: FontWeight.normal,
              fontSize:  13,
              color: colorTitle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.trainingPill.title,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              letterSpacing: 1,
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: colorText,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  _isVideoVisible = !_isVideoVisible;
                  _initializeVideo(idYoutubeVideo);
                });
              },
              icon: const Icon(
                Icons.play_circle_fill_outlined,
                color: AppColors.chatButtonsGray, size: 30,),),
            Text(
              '${widget.trainingPill.duration} min',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                letterSpacing: 1,
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: colorText,
              ),
            ),
            SizedBox(width: 25,),
            buildShareTrainingPill(context, widget.trainingPill, Constants.grey),
            SizedBox(width: 5,),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.heart),
              tooltip: 'Me gusta',
              color: AppColors.darkGray,
              iconSize: 20,
              onPressed: () => showAlertUserAnonimous(context),
            ),
          ],
        ),
      ]
    );
  }


  Widget playVideoArea() {
    return Container(
      child: YoutubePlayerControllerProvider(
        // Provides controller to all the widget below it.
          controller: _controller,
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            enableFullScreenOnVerticalDrag: true,
          )),
    );
  }

  void _initializeVideo(String id) async {
    // Generate a new controller and set as global _controller
    final controller = YoutubePlayerController.fromVideoId(
      videoId: id,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
      ),
    );
    setState(() {
      _controller = controller;
      _isVideoVisible = true;
    });
    _controller..setFullScreenListener(
          (_) async {
        final videoData = await _controller.videoData;
        final startSeconds = await _controller.currentTime;
        final currentTime =
        await FullscreenYoutubePlayer.launch(
          context,
          videoId: videoData.videoId,
          startSeconds: startSeconds,
        );

        if (currentTime != null) {
          _controller.seekTo(seconds: currentTime);
        }
      },
    );
  }

}