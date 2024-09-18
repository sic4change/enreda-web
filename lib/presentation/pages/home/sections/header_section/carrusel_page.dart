import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:enreda_app/presentation/pages/home/sections/header_section/cards_section_mobile.dart';
import 'package:enreda_app/presentation/pages/home/sections/header_section/cards_section_web.dart';
import 'package:enreda_app/presentation/pages/home/sections/header_section/main_page_mobile.dart';
import 'package:enreda_app/presentation/pages/home/sections/header_section/main_page_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../utils/responsive.dart';
import '../../../../../values/values.dart';
import '../../../../layout/adaptive.dart';
import '../../../../widgets/spaces.dart';


const double kSpacing = 28.0;
const double kRunSpacing = 16.0;

class CarruselSection extends StatefulWidget {
  CarruselSection({
    Key? key,
    required this.switchIsShowingResources,
    required this.isShowingResources }) : super(key: key);

  final VoidCallback switchIsShowingResources;
  final bool isShowingResources;

  @override
  _CarruselSectionState createState() => _CarruselSectionState();
}

class _CarruselSectionState extends State<CarruselSection> {
  final int pageLength = Data.mainPageData.length;
  int currentPageIndex = 0;
  CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);

    return Container(
      child: Column(
        children: [
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double widthOfScreen = sizingInformation.screenSize.width;
              double heightOfScreen = sizingInformation.screenSize.height;
              if (widthOfScreen <= (RefinedBreakpoints().tabletLarge)) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: screenWidth,
                      height: Responsive.isMobile(context) ? heightOfScreen * 1.3 : heightOfScreen * 0.80,
                      child: CarouselSlider.builder(
                        itemCount: pageLength,
                        carouselController: _carouselController,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          MainPageData page = Data.mainPageData[index];
                          return MainPageMobile(
                            switchIsShowingResources: widget.switchIsShowingResources,
                            isShowingResources: widget.isShowingResources,
                            circleImagePath: page.circleImagePath,
                            headerImagePath: page.headerImagePath,
                            introText: page.introText,
                            positionText: page.positionText,
                            aboutText: page.aboutText,
                            buttonText: page.buttonText,
                            storesButtons: page.storesButtons,
                            chatButton: page.chatButton,
                          );
                        },
                        options: CarouselOptions(
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration: Duration(milliseconds: 3000),
                            autoPlayInterval: Duration(seconds: 7),
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 0.4,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPageIndex = index;
                              });
                            }
                        ),
                      ),
                    ),
                    SpaceH12(),
                    _buildDotsIndicator(
                      pageLength: pageLength,
                      currentIndex: currentPageIndex,
                    ),
                    CardsSectionMobile(),
                  ],
                );
              } else if (widthOfScreen > RefinedBreakpoints().tabletLarge) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: screenWidth,
                      height: Responsive.isDesktopS(context) ? heightOfScreen * 0.80 : heightOfScreen * 0.85,
                      child: CarouselSlider.builder(
                        itemCount: pageLength,
                        carouselController: _carouselController,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          MainPageData page = Data.mainPageData[index];
                          return MainPageWeb(
                            switchIsShowingResources: widget.switchIsShowingResources,
                            isShowingResources: widget.isShowingResources,
                            circleImagePath: page.circleImagePath,
                            headerImagePath: page.headerImagePath,
                            introText: page.introText,
                            positionText: page.positionText,
                            aboutText: page.aboutText,
                            buttonText: page.buttonText,
                            storesButtons: page.storesButtons,
                            chatButton: page.chatButton,
                            context: context,
                          );
                        },
                        options: CarouselOptions(
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration: Duration(milliseconds: 3000),
                            autoPlayInterval: Duration(seconds: 7),
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPageIndex = index;
                              });
                            }
                        ),
                      ),
                    ),
                    SpaceH12(),
                    _buildDotsIndicator(
                      pageLength: pageLength,
                      currentIndex: currentPageIndex,
                    ),
                    CardsSectionWeb(),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  CarouselOptions carouselOptions({
    bool autoPlay = true,
    bool enlargeCenterPage = false,
    bool enableInfiniteScroll = true,
    double viewportFraction = 1.0,
    double aspectRatio = 0.1,
    int initialPage = 1,
    ScrollPhysics? scrollPhysics = const NeverScrollableScrollPhysics(),
  }) {
    return CarouselOptions(
        autoPlay: autoPlay,
        enableInfiniteScroll: enableInfiniteScroll,
        enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
        aspectRatio: aspectRatio,
        initialPage: initialPage,
        scrollPhysics: scrollPhysics,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            currentPageIndex = index;
          });
        });
  }

  Widget _buildDotsIndicator({
    required int pageLength,
    required int currentIndex,
  }) {
    return Container(
      child: DotsIndicator(
        dotsCount: pageLength,
        position: currentIndex,
        onTap: (index) {
          _moveToNextCarousel(index.toInt());
        },
        decorator: DotsDecorator(
          color: AppColors.greyAlt,
          activeColor: AppColors.greyBlue,
          size: Size(Sizes.SIZE_6, Sizes.SIZE_6),
          activeSize: Size(Sizes.SIZE_24, Sizes.SIZE_6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(Sizes.RADIUS_8),
            ),
          ),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(Sizes.RADIUS_8),
            ),
          ),
          spacing: EdgeInsets.symmetric(horizontal: Sizes.SIZE_4),
        ),
      ),
    );
  }

  _moveToNextCarousel(int index) {
    setState(() {
      currentPageIndex = index;
      _carouselController.animateToPage(index);
    });
  }
}
