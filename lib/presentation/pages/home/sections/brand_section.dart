import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/company_card.dart';
import '../../../widgets/enreda_info_section.dart';
import '../../../widgets/spaces.dart';


class CompaniesSection extends StatefulWidget {
  CompaniesSection({Key? key});

  @override
  State<CompaniesSection> createState() => _CompaniesSectionState();
}

class _CompaniesSectionState extends State<CompaniesSection> {
  CarouselOptions carouselOptions({
    bool autoPlay = true,
    bool enlargeCenterPage = false,
    double viewportFraction = 1.0,
    double aspectRatio = 0.1,
    int initialPage = 2,
    ScrollPhysics? scrollPhysics = const NeverScrollableScrollPhysics(),
  }) {
    return CarouselOptions(
      autoPlay: autoPlay,
      enlargeCenterPage: enlargeCenterPage,
      viewportFraction: viewportFraction,
      aspectRatio: aspectRatio,
      initialPage: initialPage,
      scrollPhysics: scrollPhysics,
    );
  }

  final int blogLength = Data.branding.length;
  final _carouselController = CarouselSliderController();
  int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          EnredaInfoSection4(
            title1: StringConst.HANDS,
          ),
          SpaceH40(),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width ;
              double heightOfCarousel = screenWidth > 800 ? 100 : 60;
              double widthOfCarousel = screenWidth > 800 ? 120 : 80;
              if (screenWidth <= (RefinedBreakpoints().tabletLarge)) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 120,
                      width: widthOfScreen(context),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth < 850 ? 20 : 100),
                      child: CarouselSlider.builder(
                        itemCount: 10,
                        carouselController: _carouselController,
                        itemBuilder: (
                          BuildContext context,
                          int itemIndex,
                          int pageViewIndex,
                        ) {
                          if (itemIndex == 0) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.sic4change.org/",
                              imageUrl: ImagePath.PORTFOLIO_1,
                              imageUrlBn: ImagePath.PORTFOLIO_1bn,
                              title: StringConst.SIC4CHANGE,
                            );
                          } else if (itemIndex == 1) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.proyectokieu.org/",
                              imageUrl: ImagePath.PORTFOLIO_2,
                              imageUrlBn: ImagePath.PORTFOLIO_2bn,
                              title: StringConst.PROYECTO_KIEU,
                            );
                          } else if (itemIndex == 2) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://fundacionlacaixa.org/es/",
                              imageUrl: ImagePath.PORTFOLIO_3,
                              imageUrlBn: ImagePath.PORTFOLIO_3bn,
                              title: StringConst.LA_CAIXA,
                            );
                          } else if (itemIndex == 3) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.copanchorti.org/",
                              imageUrl: ImagePath.PORTFOLIO_4,
                              imageUrlBn: ImagePath.PORTFOLIO_4bn,
                              title: StringConst.COPAN,
                            );
                          } else if (itemIndex == 4) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.gobiernodecanarias.org/principal/",
                              imageUrl: ImagePath.PORTFOLIO_5,
                              imageUrlBn: ImagePath.PORTFOLIO_5bn,
                              title: StringConst.GOBCAN,
                            );
                          } else if (itemIndex == 5) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mdsocialesa2030.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_6,
                              imageUrlBn: ImagePath.PORTFOLIO_6bn,
                              title: StringConst.GOBES,
                            );
                          } else if (itemIndex == 6) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mites.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_7,
                              imageUrlBn: ImagePath.PORTFOLIO_7bn,
                              title: StringConst.GOBES,
                            );
                          } else if (itemIndex == 7) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://planderecuperacion.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_8,
                              imageUrlBn: ImagePath.PORTFOLIO_8bn,
                              title: StringConst.PRTR,
                            );
                          } else if (itemIndex == 8) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mdsocialesa2030.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_9,
                              imageUrlBn: ImagePath.PORTFOLIO_9bn,
                              title: StringConst.AGENDA2030,
                            );
                          } else if (itemIndex == 9) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://next-generation-eu.europa.eu/index_es",
                              imageUrl: ImagePath.PORTFOLIO_10,
                              imageUrlBn: ImagePath.PORTFOLIO_10bn,
                              title: StringConst.NEXT_GEN_EU,
                            );
                          } else {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.sic4change.org/",
                              imageUrl: ImagePath.PORTFOLIO_1,
                              imageUrlBn: ImagePath.PORTFOLIO_1bn,
                              title: StringConst.SIC4CHANGE,
                            );
                          }
                        },
                        options: CarouselOptions(
                          viewportFraction: screenWidth < 600 ? 0.35 : 0.2,
                          aspectRatio: 1.0,
                          initialPage: 0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPageIndex = index;
                              });
                            },
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
              } else if (screenWidth < 1400 && screenWidth > 700) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 150,
                      width: widthOfScreen(context),
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: CarouselSlider.builder(
                        itemCount: 10,
                        carouselController: _carouselController,
                        itemBuilder: (
                          BuildContext context,
                          int itemIndex,
                          int pageViewIndex,
                        ) {
                          if (itemIndex == 0) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.sic4change.org/",
                              imageUrl: ImagePath.PORTFOLIO_1,
                              imageUrlBn: ImagePath.PORTFOLIO_1bn,
                              title: StringConst.SIC4CHANGE,
                            );
                          } else if (itemIndex == 1) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.proyectokieu.org/",
                              imageUrl: ImagePath.PORTFOLIO_2,
                              imageUrlBn: ImagePath.PORTFOLIO_2bn,
                              title: StringConst.PROYECTO_KIEU,
                            );
                          } else if (itemIndex == 2) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://fundacionlacaixa.org/es/",
                              imageUrl: ImagePath.PORTFOLIO_3,
                              imageUrlBn: ImagePath.PORTFOLIO_3bn,
                              title: StringConst.LA_CAIXA,
                            );
                          } else if (itemIndex == 3) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.copanchorti.org/",
                              imageUrl: ImagePath.PORTFOLIO_4,
                              imageUrlBn: ImagePath.PORTFOLIO_4bn,
                              title: StringConst.COPAN,
                            );
                          } else if (itemIndex == 4) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.gobiernodecanarias.org/principal/",
                              imageUrl: ImagePath.PORTFOLIO_5,
                              imageUrlBn: ImagePath.PORTFOLIO_5bn,
                              title: StringConst.GOBCAN,
                            );
                          } else if (itemIndex == 5) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mdsocialesa2030.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_6,
                              imageUrlBn: ImagePath.PORTFOLIO_6bn,
                              title: StringConst.GOBES,
                            );
                          } else if (itemIndex == 6) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mites.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_7,
                              imageUrlBn: ImagePath.PORTFOLIO_7bn,
                              title: StringConst.GOBES,
                            );
                          } else if (itemIndex == 7) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://planderecuperacion.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_8,
                              imageUrlBn: ImagePath.PORTFOLIO_8bn,
                              title: StringConst.PRTR,
                            );
                          } else if (itemIndex == 8) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mdsocialesa2030.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_9,
                              imageUrlBn: ImagePath.PORTFOLIO_9bn,
                              title: StringConst.AGENDA2030,
                            );
                          } else if (itemIndex == 9) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://next-generation-eu.europa.eu/index_es",
                              imageUrl: ImagePath.PORTFOLIO_10,
                              imageUrlBn: ImagePath.PORTFOLIO_10bn,
                              title: StringConst.NEXT_GEN_EU,
                            );
                          } else {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.sic4change.org/",
                              imageUrl: ImagePath.PORTFOLIO_1,
                              imageUrlBn: ImagePath.PORTFOLIO_1bn,
                              title: StringConst.SIC4CHANGE,
                            );
                          }
                        },
                        options: CarouselOptions(
                          viewportFraction: 0.2,
                          aspectRatio: 1.0,
                          initialPage: 0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPageIndex = index;
                            });
                          },
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
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 150,
                      width: widthOfScreen(context),
                      padding: const EdgeInsets.symmetric(horizontal: 200.0),
                      child: CarouselSlider.builder(
                        itemCount: 10,
                        carouselController: _carouselController,
                        itemBuilder: (
                          BuildContext context,
                          int itemIndex,
                          int pageViewIndex,
                        ) {
                          if (itemIndex == 0) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.sic4change.org/",
                              imageUrl: ImagePath.PORTFOLIO_1,
                              imageUrlBn: ImagePath.PORTFOLIO_1bn,
                              title: StringConst.SIC4CHANGE,
                            );
                          } else if (itemIndex == 1) {
                            return CompanyCard(
                                height: heightOfCarousel,
                                width: widthOfCarousel,
                                url: "https://www.proyectokieu.org/",
                                imageUrl: ImagePath.PORTFOLIO_2,
                                imageUrlBn: ImagePath.PORTFOLIO_2bn,
                                title: StringConst.PROYECTO_KIEU,
                            );
                          } else if (itemIndex == 2) {
                              return CompanyCard(
                                  height: heightOfCarousel,
                                  width: widthOfCarousel,
                                  url: "https://fundacionlacaixa.org/es/",
                                  imageUrl: ImagePath.PORTFOLIO_3,
                                  imageUrlBn: ImagePath.PORTFOLIO_3bn,
                                  title: StringConst.LA_CAIXA,
                              );
                          } else if (itemIndex == 3) {
                                return CompanyCard(
                                    height: heightOfCarousel,
                                    width: widthOfCarousel,
                                    url: "https://www.copanchorti.org/",
                                    imageUrl: ImagePath.PORTFOLIO_4,
                                    imageUrlBn: ImagePath.PORTFOLIO_4bn,
                                    title: StringConst.COPAN,
                                );
                          } else if (itemIndex == 4) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.gobiernodecanarias.org/principal/",
                              imageUrl: ImagePath.PORTFOLIO_5,
                              imageUrlBn: ImagePath.PORTFOLIO_5bn,
                              title: StringConst.GOBCAN,
                            );
                          } else if (itemIndex == 5) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mdsocialesa2030.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_6,
                              imageUrlBn: ImagePath.PORTFOLIO_6bn,
                              title: StringConst.GOBES,
                            );
                          } else if (itemIndex == 6) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mites.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_7,
                              imageUrlBn: ImagePath.PORTFOLIO_7bn,
                              title: StringConst.GOBES,
                            );
                          } else if (itemIndex == 7) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://planderecuperacion.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_8,
                              imageUrlBn: ImagePath.PORTFOLIO_8bn,
                              title: StringConst.PRTR,
                            );
                          } else if (itemIndex == 8) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.mdsocialesa2030.gob.es/",
                              imageUrl: ImagePath.PORTFOLIO_9,
                              imageUrlBn: ImagePath.PORTFOLIO_9bn,
                              title: StringConst.AGENDA2030,
                            );
                          } else if (itemIndex == 9) {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://next-generation-eu.europa.eu/index_es",
                              imageUrl: ImagePath.PORTFOLIO_10,
                              imageUrlBn: ImagePath.PORTFOLIO_10bn,
                              title: StringConst.NEXT_GEN_EU,
                            );
                          } else {
                            return CompanyCard(
                              height: heightOfCarousel,
                              width: widthOfCarousel,
                              url: "https://www.sic4change.org/",
                              imageUrl: ImagePath.PORTFOLIO_1,
                              imageUrlBn: ImagePath.PORTFOLIO_1bn,
                              title: StringConst.SIC4CHANGE,
                            );
                          }
                        },
                        options: CarouselOptions(
                          viewportFraction: 0.15,
                          aspectRatio: 1.0,
                          initialPage: 0,
                          onPageChanged: (index, reason) {
                          setState(() {
                            currentPageIndex = index;
                          });
                        },),
                      ),
                    ),
                    SpaceH30(),
                    _buildDotsIndicator(
                      pageLength: blogLength,
                      currentIndex: currentPageIndex,
                    ),
                  ],
                );
              }
            },
          ),
          SpaceH40(),
          /*Align(
            alignment: Alignment.center,
            child: EnredaButton(
              buttonTitle: StringConst.HIRE_ME,
              buttonColor: AppColors.primaryColor,
              onPressed: () {},
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildDotsIndicator({
    required int pageLength,
    required int currentIndex,
  }) {
    return Container(
      child: DotsIndicator(
        dotsCount: 10,
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
