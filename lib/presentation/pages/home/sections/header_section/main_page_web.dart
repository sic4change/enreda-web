import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:enreda_app/presentation/pages/home/sections/header_section/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../values/values.dart';
import '../../../../layout/adaptive.dart';
import '../../../../widgets/spaces.dart';
import '../../../resources/sections/show_alert_user_anonimous.dart';

const double bodyTextSizeLg = 16.0;
const double bodyTextSizeSm = 14.0;
const double socialTextSizeLg = 18.0;
const double socialTextSizeSm = 14.0;

class MainPageData {
  final String circleImagePath, headerImagePath, introText, positionText, aboutText, buttonText;
  final Widget? storesButtons;
  final bool? chatButton;

  MainPageData({
    required this.circleImagePath,
    required this.headerImagePath,
    required this.introText,
    required this.positionText,
    required this.aboutText,
    required this.buttonText,
    this.storesButtons,
    this.chatButton,
  });
}

class MainPageWeb extends StatefulWidget {
  const MainPageWeb(
      { Key? key,
        required this.switchIsShowingResources,
        required this.isShowingResources,
        required this.circleImagePath,
        required this.headerImagePath,
        required this.introText,
        required this.positionText,
        required this.aboutText,
        required this.buttonText,
        required this.context,
        this.storesButtons,
        this.chatButton,

      }) : super(key: key);

  final VoidCallback switchIsShowingResources;
  final bool isShowingResources;
  final String circleImagePath, headerImagePath, introText, positionText, aboutText, buttonText;
  final Widget? storesButtons;
  final bool? chatButton;
  final BuildContext context;

  @override
  _MainPageWebState createState() => _MainPageWebState();
}

class _MainPageWebState extends State<MainPageWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double headerIntroTextSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_50,
      Sizes.TEXT_SIZE_70,
      md: Sizes.TEXT_SIZE_40,
    );
    double bodyTextSize =
    responsiveSize(context, bodyTextSizeSm, bodyTextSizeLg);
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    TextStyle? bodyTextStyle =
    textTheme.bodyText1?.copyWith(fontSize: bodyTextSize);
    double sizeOfBlobSm = screenWidth * 0.3;
    double sizeOfGoldenGlobe = screenWidth * 0.2;
    double dottedGoldenGlobeOffset = sizeOfBlobSm * 0.4;
    double heightOfBlobAndGlobe =
    computeHeight(dottedGoldenGlobeOffset, sizeOfGoldenGlobe, sizeOfBlobSm);
    double heightOfStack = heightOfBlobAndGlobe * 1.3;
    double textSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_15,
      Sizes.TEXT_SIZE_20,
      md: Sizes.TEXT_SIZE_18,
    );

    return Stack(
      children: [
        Container(
          height: screenHeight * 0.82,
          child: Stack(
            children: [
              Positioned(
                top: 24,
                right: sizeOfBlobSm * -0.3,
                child: Image.asset(
                  widget.circleImagePath,
                  height: heightOfStack * 1.2,
                ),
              ),
              Positioned(
                top: 70,
                right: sizeOfBlobSm * 0.2,
                child: HeaderImage(
                  controller: _controller,
                  imagePath: widget.headerImagePath,
                  globeSize: sizeOfGoldenGlobe,
                  imageHeight: Responsive.isDesktopL(context) ? screenHeight * 0.75 : heightOfStack,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: heightOfStack * 0.1, left: (sizeOfBlobSm * 0.2)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints:
                        BoxConstraints(maxWidth: screenWidth * 0.35),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              widget.introText,
                              speed: Duration(milliseconds: 70),
                              textStyle: textTheme.headline2?.copyWith(
                                fontSize: headerIntroTextSize,
                              ),
                            ),
                          ],
                          onTap: () {},
                          isRepeatingAnimation: false,
                          totalRepeatCount: 5,
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                        BoxConstraints(maxWidth: screenWidth * 0.35),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              widget.positionText,
                              speed: Duration(milliseconds: 80),
                              textStyle: textTheme.headline2?.copyWith(
                                fontSize: headerIntroTextSize,
                                color: AppColors.blueMain,
                                height: 1.2,
                              ),
                            ),
                          ],
                          onTap: () {},
                          isRepeatingAnimation: true,
                          totalRepeatCount: 5,
                        ),
                      ),
                      SpaceH16(),
                      ConstrainedBox(
                        constraints:
                        BoxConstraints(maxWidth: screenWidth * 0.35),
                        child: SelectableText(
                          widget.aboutText,
                          style: bodyTextStyle?.copyWith(
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SpaceH50(),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.turquoiseDark,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                textStyle: textTheme.button?.copyWith(
                                  fontSize: textSize,
                                  letterSpacing: 1.8,
                                ),
                              ),
                              onPressed: () {
                                if(widget.chatButton!)
                                  showAlertUserAnonimousChat(context);
                                else if (!widget.isShowingResources)
                                  widget.switchIsShowingResources();
                              },
                              child: Padding(
                                padding: widget.chatButton == true ? EdgeInsets.symmetric(horizontal: 20.0, vertical: 10) : EdgeInsets.all(22.0),
                                child: Row(
                                  children: [
                                    Text(widget.buttonText.toUpperCase()),
                                    widget.chatButton == true ?
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: SizedBox(
                                        child: Image.asset(
                                          ImagePath.BUTTON_CHAT,
                                          height: 50,
                                        ),
                                      ),
                                    ) : Container()
                                  ],
                                ),
                              ),
                            ),
                            Responsive.isDesktopS(context) || Responsive.isTablet(context) ? SpaceH30() : SpaceH80(),
                            widget.storesButtons != null ? widget.storesButtons! : Container(),
                          ],
                        ),
                      ),
                      SpaceH20(),
                      Wrap(
                        children: buildSocialIcons(Data.socialData),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

}
