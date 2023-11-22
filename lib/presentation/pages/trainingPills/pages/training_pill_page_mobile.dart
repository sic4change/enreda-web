import 'package:enreda_app/models/trainingPill.dart';
import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/resources/sections/show_alert_user_anonimous.dart';
import 'package:enreda_app/presentation/pages/trainingPills/build_share_training_pill.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/services/database.dart';
import 'package:enreda_app/utils/const.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../values/values.dart';
import '../../../widgets/show_back_icon.dart';

class TrainingPillDetailPage extends StatefulWidget {
  const TrainingPillDetailPage({Key? key, required this.trainingPillId})
      : super(key: key);
  final String trainingPillId;

  @override
  _TrainingPillDetailPageState createState() => _TrainingPillDetailPageState();
}

class _TrainingPillDetailPageState extends State<TrainingPillDetailPage> {
  late TrainingPill trainingPill;
  late YoutubePlayerController _controller;
  bool _isVideoVisible = false;
  String? codeDialog;
  String? valueText;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    TextTheme textTheme = Theme.of(context).textTheme;
    return StreamBuilder(
        stream: database.trainingPillStreamById(widget.trainingPillId),
        builder: (context, snapshotTrainingPill) {
          if (!snapshotTrainingPill.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          trainingPill = snapshotTrainingPill.data as TrainingPill;
          trainingPill.setTrainingPillCategoryName();
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text('Pildoras formativas',
                    textAlign: TextAlign.start,
                    style: textTheme.titleSmall?.copyWith(
                      color: Constants.white,
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      //fontSize: fontSize,
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.primaryColor,
              elevation: 0.0,
              leading: showBackIconButton(context, AppColors.white),
            ),
            body: _buildTrainingPillDetail(),
          );

        });
  }

  Widget _buildTrainingPillDetail() {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 12, 13, md: 12);
    double sidePadding = responsiveSize(context, 15, 20, md: 17);
    final isBigScreen = MediaQuery.of(context).size.width >= 900;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          constraints: BoxConstraints(
            maxWidth: Responsive.isMobile(context) ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * 0.5,
            maxHeight: Responsive.isMobile(context) || Responsive.isDesktopS(context) ? 550 : MediaQuery.of(context).size.height * 0.75,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyBorder, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Constants.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyBorder,
                  spreadRadius: 0.2,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: playArea(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(sidePadding),
                                child: Text(
                                  trainingPill.trainingPillCategoryName!,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: textTheme.titleSmall?.copyWith(
                                    color: Constants.lilac,
                                    height: 1.5,
                                    fontWeight: FontWeight.normal,
                                    fontSize: isBigScreen ? 18 : 15,
                                    //fontSize: fontSize,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: sidePadding,
                                    left: sidePadding,
                                    bottom: sidePadding / 2),
                                child: Text(
                                  trainingPill.title.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blueDark,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: sidePadding),
                                child: Text(
                                  trainingPill.description,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: AppColors.greyTxtAlt,
                                    height: 1.5,
                                    fontWeight: FontWeight.normal,
                                    fontSize: fontSize,
                                    //fontSize: fontSize,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sidePadding, vertical: sidePadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            buildShareTrainingPill(
                                context, trainingPill, Constants.grey),
                            SpaceW4(),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.heart),
                              tooltip: 'Me gusta',
                              color: AppColors.darkGray,
                              iconSize: 20,
                              onPressed: () => showAlertUserAnonimous(context),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget playArea() {
    String urlYoutubeVideo = trainingPill.urlVideo;
    String idYoutubeVideo =
    urlYoutubeVideo.substring(urlYoutubeVideo.length - 11);
    if (!_isVideoVisible)
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: InkWell(
          onTap: () async {
            setState(() {
              setState(() {
                _isVideoVisible = !_isVideoVisible;
                _initializeVideo(idYoutubeVideo);
              });
            });
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      YoutubePlayerController.getThumbnail(
                        videoId: idYoutubeVideo,
                        quality: ThumbnailQuality.max,
                      ),
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: Responsive.isMobile(context)
                      ? BorderRadius.circular(10)
                      : BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
              Center(
                child: Icon(
                  Icons.play_circle_rounded,
                  color: AppColors.black100.withOpacity(0.7),
                  size: 70,
                ),
              ),
            ],
          ),
        ),
      );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: YoutubePlayerControllerProvider(
        // Provides controller to all the widget below it.
          controller: _controller,
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          )),
    );
  }

  _initializeVideo(String id) {
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
      if (_isVideoVisible == false) {
        _isVideoVisible = true;
      }
    });
    _controller.toggleFullScreen();
  }


}
