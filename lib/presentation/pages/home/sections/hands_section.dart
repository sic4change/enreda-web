import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/content_area.dart';
import '../../../widgets/enreda_info_section.dart';
import '../../../widgets/project_item.dart';
import '../../../widgets/spaces.dart';

const double kSpacing = 20.0;
const double kRunSpacing = 16.0;

class HandCategoryData {
  final String title;
  final int number;
  bool isSelected;

  HandCategoryData({
    required this.title,
    required this.number,
    this.isSelected = false,
  });
}

class HandsSection extends StatefulWidget {
  HandsSection({Key? key});

  @override
  _HandsSectionState createState() => _HandsSectionState();
}

class _HandsSectionState extends State<HandsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _companyController;
  late Animation<double> _companyScaleAnimation;

  late List<CompanyData> selectedCompany;
  late List<HandCategoryData> companies;

  @override
  void initState() {
    super.initState();
    selectedCompany = Data.allProjects;
    companies = Data.projectCategories;
    _companyController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _companyScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _companyController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _companyController.dispose();
    super.dispose();
  }

  Future<void> _playProjectAnimation() async {
    try {
      await _companyController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double contentAreaWidth = screenWidth;
    return VisibilityDetector(
      key: Key('project-section-sm'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 20) {
          _playProjectAnimation();
        }
      },
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: getSidePadding(context)),
              child: ContentArea(
                width: contentAreaWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEnredaInfoSectionSm(),
                    SpaceH40(),
                    /*EnredaButton(
                      buttonTitle: StringConst.ALL_PROJECTS,
                      buttonColor: AppColors.primaryColor,
                      onPressed: () {},
                    ),
                    SpaceH40(),*/
                    Wrap(
                      spacing: kSpacing,
                      runSpacing: kRunSpacing,
                      children: _buildCompanies(companies),
                    ),
                    SpaceH40(),
                    Wrap(
                      runSpacing: assignHeight(context, 0.05),
                      children: _buildProjects(
                        selectedCompany,
                        isMobile: true,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return VisibilityDetector(
              key: Key('project-section_lg'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 40) {
                  _playProjectAnimation();
                }
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getSidePadding(context),
                    ),
                    child: ContentArea(
                      width: contentAreaWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContentArea(
                            width: contentAreaWidth * 0.6,
                            child: _buildEnredaInfoSectionLg(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SpaceH40(),
                  Container(
                    width: widthOfScreen(context),
                    child: Wrap(
                      spacing: assignWidth(context, 0.025),
                      runSpacing: assignWidth(context, 0.025),
                      children: _buildProjects(selectedCompany),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildEnredaInfoSectionSm() {
    return EnredaInfoSection2(
      hasSectionTitle: true,
      hasTitle1: true,
      hasTitle2: false,
      hasBody: false,
      sectionTitle: StringConst.COCREATE,
      title1: StringConst.HAND_TITLE,
//      child: ,
    );
  }

  Widget _buildEnredaInfoSectionLg() {
    return EnredaInfoSection1(
      sectionTitle: StringConst.COCREATE,
      title1: StringConst.HAND_TITLE,
      hasTitle2: false,
      body: "",
      child: Wrap(
        spacing: kSpacing,
        runSpacing: kRunSpacing,
        children: _buildCompanies(companies),
      ),
    );
  }

  List<Widget> _buildCompanies(List<HandCategoryData> categories) {
    List<Widget> items = [];
    return items;
  }

  List<Widget> _buildProjects(List<CompanyData> data, {bool isMobile = false}) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(
        ScaleTransition(
          scale: _companyScaleAnimation,
          child: CompanyItem(
            width: isMobile
                ? assignWidth(context, data[index].mobileWidth)
                : assignWidth(context, data[index].width),
            height: isMobile
                ? assignHeight(context, data[index].mobileHeight)
                : assignHeight(context, data[index].height),
            bannerHeight: isMobile
                ? assignHeight(context, data[index].mobileHeight) / 2
                : assignHeight(context, data[index].height) / 3,
            title: data[index].title,
            subtitle: data[index].category,
            imageUrl: data[index].projectCoverUrl,
            url: data[index].url
          ),
        ),
      );
    }

    return items;
  }

  void onProjectCategoryTap(index) {
    _companyController.reset();
    changeCategorySelected(index);
    setState(() {
      selectedCompany = Data.allProjects;
      _playProjectAnimation();
    });
  }

  changeCategorySelected(int selectedIndex) {
    for (int index = 0; index < companies.length; index++) {
      if (index == selectedIndex) {
        setState(() {
          companies[selectedIndex].isSelected = true;
        });
      } else {
        companies[index].isSelected = false;
      }
    }
  }
}

class ProjectCategory extends StatefulWidget {
  ProjectCategory({
    required this.title,
    required this.number,
    this.titleColor = AppColors.black,
    this.numberColor = Colors.transparent,
    this.hoverColor = AppColors.primaryColor,
    this.titleStyle,
    this.numberStyle,
    this.onTap,
    this.isSelected = false,
  });

  final String title;
  final Color titleColor;
  final Color numberColor;
  final TextStyle? titleStyle;
  final int number;
  final Color hoverColor;
  final TextStyle? numberStyle;
  final GestureTapCallback? onTap;
  final bool isSelected;

  @override
  _ProjectCategoryState createState() => _ProjectCategoryState();
}

class _ProjectCategoryState extends State<ProjectCategory>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.titleColor;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: widget.titleStyle?.copyWith(
                      color: colorOfCategory(),
                    ) ??
                    textTheme.titleMedium?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_16,
                      color: colorOfCategory(),
                    ),
              ),
              WidgetSpan(
                child: widget.isSelected
                    ? numberOfProjectItems()
                    : FadeTransition(
                        opacity: _controller.view,
                        child: numberOfProjectItems(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget numberOfProjectItems() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Transform.translate(
      offset: const Offset(2, -8),
      child: Text(
        "(${widget.number})",
        textScaleFactor: 0.7,
        style: widget.numberStyle?.copyWith(
              color: widget.hoverColor,
            ) ??
            textTheme.titleMedium?.copyWith(
              fontSize: Sizes.TEXT_SIZE_16,
              color: widget.hoverColor,
            ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
    if (hovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Color colorOfSuperScript() {
    if (_isHovering) {
      return widget.hoverColor;
    } else if (widget.isSelected) {
      return widget.hoverColor;
    } else {
      return widget.numberColor;
    }
  }

  Color colorOfCategory() {
    if (_isHovering) {
      return widget.hoverColor;
    } else if (widget.isSelected) {
      return widget.hoverColor;
    } else {
      return widget.titleColor;
    }
  }
}
