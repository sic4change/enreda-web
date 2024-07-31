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
const double sidePadding = Sizes.PADDING_20;

class MainPageMobile extends StatefulWidget {
  const MainPageMobile(
      { Key? key,
        required this.switchIsShowingResources,
        required this.isShowingResources,
        required this.circleImagePath,
        required this.headerImagePath,
        required this.introText,
        required this.positionText,
        required this.aboutText,
        required this.buttonText,
        this.storesButtons,
        this.chatButton,
      }) : super(key: key);

  final VoidCallback switchIsShowingResources;
  final bool isShowingResources;
  final String circleImagePath, headerImagePath, introText, positionText, aboutText, buttonText;
  final Widget? storesButtons;
  final bool? chatButton;

  @override
  _MainPageMobileState createState() => _MainPageMobileState();
}

class _MainPageMobileState extends State<MainPageMobile>
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
    double screenWidth = widthOfScreen(context) - (sidePadding * 2);
    double screenHeight = heightOfScreen(context);
    double headerIntroTextSize = Responsive.isMobile(context) ? Sizes.TEXT_SIZE_24 : Sizes.TEXT_SIZE_34;
    double headerBodyTextSize = Responsive.isMobile(context) ? Sizes.TEXT_SIZE_15 : Sizes.TEXT_SIZE_18;
    double maxWidthBody = Responsive.isMobile(context) ? screenWidth : screenWidth;
    double fontSizeButtonDiscover = Responsive.isMobile(context) ? 14 : 16;
    FontWeight fontWeightBody = Responsive.isMobile(context) ? FontWeight.w600 : FontWeight.w600;
    TextStyle? bodyTextStyle =
    textTheme.bodyText1?.copyWith(fontSize: bodyTextSizeSm);
    double sizeOfBlobSm = screenWidth * 0.2;
    double sizeOfGoldenGlobe = screenWidth * 0.3;
    double dottedGoldenGlobeOffset = sizeOfBlobSm * 0.4;
    double heightOfBlobAndGlobe =
    computeHeight(dottedGoldenGlobeOffset, sizeOfGoldenGlobe, sizeOfBlobSm);
    double heightOfStack = heightOfBlobAndGlobe * 2;

    return Column(
      children: [
        Responsive.isMobile(context) ? SpaceH20() : SpaceH50(),
        Stack(
          children: [
            Positioned(
              top: 0,
              right: Responsive.isMobile(context) ? sizeOfBlobSm * -1.9 : sizeOfBlobSm * -0.9,
              child: Image.asset(
                widget.circleImagePath,
                height: Responsive.isMobile(context) ? heightOfStack * 1.5 : heightOfStack * 0.9,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 30.0 : 50.0),
              child: Column(
                children: [
                  Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints:
                        BoxConstraints(maxWidth: screenWidth * 0.9),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              widget.introText,
                              speed: Duration(milliseconds: 70),
                              textAlign: TextAlign.left,
                              textStyle: textTheme.headline2?.copyWith(
                                fontSize: headerIntroTextSize,
                              ),
                            ),
                          ],
                          onTap: () {},
                          isRepeatingAnimation: true,
                          totalRepeatCount: 5,
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                        BoxConstraints(maxWidth: screenWidth * 0.9),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              widget.positionText,
                              speed: Duration(milliseconds: 80),
                              textAlign: TextAlign.left,
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
                    ],
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpaceH20(),
                        ConstrainedBox(
                          constraints:
                          BoxConstraints(maxWidth: maxWidthBody),
                          child: SelectableText(
                            widget.aboutText,
                            style: bodyTextStyle?.copyWith(
                              height: 1.5,
                              fontWeight: fontWeightBody,
                              fontSize: headerBodyTextSize,
                            ),
                          ),
                        ),
                        SpaceH50(),
                        Container(
                          child: HeaderImage(
                            controller: _controller,
                            imagePath: widget.headerImagePath,
                            globeSize: sizeOfGoldenGlobe,
                            imageHeight: Responsive.isTablet(context) ? screenHeight * 0.3 : heightOfStack,
                          ),
                        ),
                        SpaceH20(),
                        Wrap(
                          children: buildSocialIcons(Data.socialData),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(sidePadding),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.turquoiseDark,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: Responsive.isMobile(context) ? 0 : 10),
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(
                            fontSize: fontSizeButtonDiscover,
                            letterSpacing: 1.2)),
                    onPressed: () {
                      if(widget.chatButton!){
                        showAlertUserAnonimousChat(context);
                      }
                      else if (!widget.isShowingResources) {
                        widget.switchIsShowingResources();
                      }
                    },
                    child: Padding(
                      padding: widget.chatButton == true ? EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0) : EdgeInsets.symmetric(vertical: 14.0, horizontal: 5.0),
                      child: Row(
                        children: [
                          Text(widget.buttonText.toUpperCase()),
                          widget.chatButton == true ?
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                  child: Image.asset(
                                    ImagePath.BUTTON_CHAT,
                                    height: 30,
                                  ),
                                ),
                              ) : Container()
                        ],
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
        SpaceH4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //BuildStoresButtons(150, 60),
            widget.storesButtons != null ? widget.storesButtons! : Container(),
          ],
        ),
      ],
    );
  }
}
