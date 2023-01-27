
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../../values/values.dart';
import 'empty.dart';

class EnredaCardData {
  String title;
  String subtitle;
  String imageString;
  Widget onTapCard;

  EnredaCardData({
    required this.title,
    required this.subtitle,
    required this.imageString,
    required this.onTapCard,
  });
}

class EnredaCard extends StatefulWidget {
  EnredaCard({
    this.leading,
    this.title,
    this.subtitle,
    required this.imageString,
    required this.onTapCard,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.start,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    this.width,
    this.height,
    this.offsetY = -40,
    this.elevation = Sizes.ELEVATION_4,
    this.hasAnimation = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.symmetric(
      horizontal: Sizes.PADDING_0,
      vertical: Sizes.PADDING_12,
    ),
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final String imageString;
  final Widget onTapCard;
  final double? width;
  final double? height;
  final double? elevation;
  final double offsetY;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final bool hasAnimation;

  @override
  _EnredaCardState createState() => _EnredaCardState();
}

class _EnredaCardState extends State<EnredaCard>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: widget.offsetY).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuart),
    );
  }

  Future<void> _animateCard() async {
    if (_hovering) {
      try {
        await _controller.forward().orCancel;
      } on TickerCanceled {}
    } else {
      try {
        await _controller.reverse().orCancel;
      } on TickerCanceled {}
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.hasAnimation
        ? MouseRegion(
            onEnter: (e) => _mouseEnter(true),
            onExit: (e) => _mouseEnter(false),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, animation.value),
                  child: _buildCard(),
                );
              },
            ),
          )
        : _buildCard();
  }

  Widget _buildCard() {
    const double widthImage = 115;
    const double heightImage = 126;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.onTapCard),
        );
      },
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyAlt.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: widget.padding,
              child: Row(
                mainAxisAlignment: widget.rowMainAxisAlignment,
                crossAxisAlignment: widget.rowCrossAxisAlignment,
                children: [
                  Spacer(),
                  Column(
                    mainAxisAlignment: widget.columnMainAxisAlignment,
                    crossAxisAlignment: widget.columnCrossAxisAlignment,
                    children: [
                      Spacer(),
                      widget.title ?? Empty(),
                      widget.title != null ? SpaceH8() : Empty(),
                      widget.subtitle ?? Empty(),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: Responsive.isTablet(context) || Responsive.isMobile(context) ? widthImage * 0.8 : widthImage,
            height: Responsive.isTablet(context) || Responsive.isMobile(context) ? heightImage * 0.8 : heightImage,
            child: ClipRRect(
              child: Image.asset(widget.imageString),
            ),
          ),
        ],
      ),
    );
  }


  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    _animateCard();
  }
}
