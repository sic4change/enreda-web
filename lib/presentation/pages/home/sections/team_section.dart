import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/person_card.dart';
import '../../../widgets/content_area.dart';
import '../../../widgets/enreda_info_section.dart';
import '../../../widgets/spaces.dart';

const double kSpacing = 28.0;
const double kRunSpacing = 16.0;

class TeamSection extends StatefulWidget {
  TeamSection({Key? key});
  @override
  _TeamSectionState createState() => _TeamSectionState();
}

class _TeamSectionState extends State<TeamSection> {
  final int blogLength = Data.blogData.length;
  int currentPageIndex = 0;
  CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);

    return Container(
      child: Column(
        children: [
          EnredaInfoSection2(
            hasSectionTitle: true,
            hasTitle1: true,
            hasTitle2: false,
            hasBody: true,
            sectionTitle: StringConst.TEAM.toUpperCase(),
            title1: StringConst.TEAM_SECTION_TITLE_1,
            body: StringConst.TEAM_DESC,
          ),
          SpaceH50(),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double widthOfScreen = sizingInformation.screenSize.width;
              if (widthOfScreen < (RefinedBreakpoints().tabletLarge)) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: widthOfScreen,
                      height: 300,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: CarouselSlider.builder(
                        itemCount: blogLength,
                        carouselController: _carouselController,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return PersonCard(
                            width: screenWidth,
                            imageWidth: screenWidth,
                            imageHeight: screenWidth,
                            person: Data.blogData[index].name,
                            position: Data.blogData[index].position,
                            buttonText: Data.blogData[index].buttonText,
                            imageUrl: Data.blogData[index].imageUrl,
                            urlLinkedin: Data.blogData[index].urlLinkedin,
                            urlTwitter: Data.blogData[index].urlTwitter,
                            onPressed: () {},
                          );
                        },
                        options: CarouselOptions(
                          aspectRatio: 0.1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPageIndex = index;
                              });
                            }
                        ),
                      ),
                    ),
                    SpaceH30(),
                    _buildDotsIndicator(
                      pageLength: blogLength,
                      currentIndex: currentPageIndex,
                    ),
                  ],
                );
              } else if (widthOfScreen >=
                      RefinedBreakpoints().tabletLarge &&
                  widthOfScreen <= 1024) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: screenWidth,
                      height: 300,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth < 850 ? 20 : 100),
                      child: CarouselSlider.builder(
                        itemCount: blogLength,
                        carouselController: _carouselController,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return PersonCard(
                            width: screenWidth * 0.45,
                            imageWidth: screenWidth * 0.45,
                            imageHeight: screenWidth * 0.45,
                            person: Data.blogData[index].name,
                            position: Data.blogData[index].position,
                            buttonText: Data.blogData[index].buttonText,
                            imageUrl: Data.blogData[index].imageUrl,
                            urlLinkedin: Data.blogData[index].urlLinkedin,
                            urlTwitter: Data.blogData[index].urlTwitter,
                            onPressed: () {},
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: 0.30,
                          autoPlay: false,
                          aspectRatio: 2 / 1.4,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPageIndex = index;
                              });
                            }
                        ),
                      ),
                    ),
                    _buildDotsIndicator(
                      pageLength: blogLength,
                      currentIndex: currentPageIndex,
                    ),
                    SpaceH100(),
                  ],
                );
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Wrap(
                        spacing: kSpacing,
                        runSpacing: kRunSpacing,
                        children: _buildBlogCards(
                          blogData: Data.blogData,
                          width: screenWidth,
                        ),
                      ),
                      SpaceH100(),
                    ],
                  ),
                );
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

  List<Widget> _buildBlogCards({
    required List<PersonCardData> blogData,
    required double width,
  }) {
    double cardWidth = ((width - (kSpacing * 3)) / 4);
    List<Widget> items = [];

    for (int index = 0; index < blogData.length; index++) {
      items.add(
        PersonCard(
          width: cardWidth,
          imageWidth: cardWidth,
          imageHeight: cardWidth,
          person: blogData[index].name,
          position: blogData[index].position,
          buttonText: blogData[index].buttonText,
          imageUrl: blogData[index].imageUrl,
          urlLinkedin: Data.blogData[index].urlLinkedin,
          urlTwitter: Data.blogData[index].urlTwitter,
          onPressed: () {},
        ),
      );
    }
    return items;
  }

  Widget _buildDotsIndicator({
    required int pageLength,
    required int currentIndex,
  }) {
    return Container(
      child: DotsIndicator(
        dotsCount: pageLength,
        position: currentIndex.toInt(),
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
