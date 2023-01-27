import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../utils/responsive.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/bullet_text.dart';
import '../../../widgets/content_area.dart';
import '../../../widgets/enreda_info_section.dart';
import '../../../widgets/spaces.dart';


class MessageSection extends StatefulWidget {

  MessageSection({Key? key});
  @override
  _MessageSectionState createState() => _MessageSectionState();
}

class _MessageSectionState extends State<MessageSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool text1InView = false;
  bool text2InView = false;

  @override
  void initState() {
    super.initState();
  
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context));
    double screenHeight = heightOfScreen(context);
    double sizeOfBlobSm = screenWidth * 0.3;

    return Column(
      children: [
        EnredaInfoSection3(
          sectionTitle: StringConst.TAG_ENREDA.toUpperCase(),
        ),
        Flex(
          direction: Responsive.isTablet(context) || Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: Responsive.isTablet(context) || Responsive.isMobile(context) ? 0 : 2,
              child: Container(
                margin: EdgeInsets.only(
                    left: (sizeOfBlobSm * 0.2), right: (sizeOfBlobSm * 0.2)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      EnredaInfoSection4(
                        title1: StringConst.WHAT_ENREDA_TITLE1,
                        title2: StringConst.WHAT_ENREDA_TITLE2,
                        title3: StringConst.WHAT_ENREDA_TITLE3,
                      ),
                      EnredaInfoSection2(
                        hasSectionTitle: false,
                        hasTitle1: false,
                        hasTitle2: false,
                        hasBody: true,
                        body: StringConst.AWARDS_DESC,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildMessage1(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: Responsive.isTablet(context) || Responsive.isMobile(context) ? 0 : 2,
              child: Container(
                margin: EdgeInsets.only(
                    left: Responsive.isTablet(context) || Responsive.isMobile(context) ? (sizeOfBlobSm * 0.2) : (sizeOfBlobSm * 0.1),
                    right: Responsive.isTablet(context) || Responsive.isMobile(context) ? (sizeOfBlobSm * 0.2) :(sizeOfBlobSm * 0.3)),
                child: _buildImage(
                  width: screenWidth,
                  height: screenHeight * 0.5,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.bodyText1?.merge(
      Styles.customTextStyle3(
        fontSize: responsiveSize(context, 64, 80, md: 76),
        height: 1.25,
        color: AppColors.primaryColor,
      ),
    );
    return ContentArea(
      width: width,
      height: height * 0.8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          YoutubePlayerControllerProvider( // Provides controller to all the widget below it.
          controller: YoutubePlayerController(
            initialVideoId: 'cJO4B_OBnvQ',
            params: YoutubePlayerParams( // Defining custom playlist
              startAt: Duration(seconds: 0),
              showControls: true,
              showFullscreenButton: true,
            ),
          ),
            child: YoutubePlayerIFrame(
              aspectRatio: 16 / 9,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage1() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConst.DIAGNOSIS_TITLE,
          style: textTheme.headline6,
        ),
        SpaceH16(),
        ..._buildMessage(Data.awards1, Data.awardsUrl1),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> _buildMessage(List<String> awards, List<String> urls) {
    List<Widget> items = [];
    for (int index = 0; index < awards.length; index++) {
      items.add(
          InkWell(
            onTap: () => _launchURL(urls[index]),
              child: TextWithBullet(text: awards[index])
          )
      );
      items.add(SpaceH12());
    }
    return items;
  }
}
