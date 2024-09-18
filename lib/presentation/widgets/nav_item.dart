import 'package:enreda_app/presentation/widgets/selected_indicator.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';
import '../layout/adaptive.dart';
import 'animated_indicator.dart';

const double indicatorWidth = Sizes.WIDTH_130;

class NavItemData {
  final String name;
  final GlobalKey key;
  bool isSelected;

  NavItemData({
    required this.name,
    required this.key,
    this.isSelected = false,
  });
}

class NavItem extends StatefulWidget {
  NavItem({
    required this.title,
    this.titleColor = AppColors.greyDark,
    this.isSelected = false,
    this.isMobile = false,
    this.titleStyle,
    this.onTap,
  });

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final bool isSelected;
  final bool isMobile;
  final GestureTapCallback? onTap;

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with SingleTickerProviderStateMixin {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double textSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_14,
      Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_15,
    );

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Container(
        padding: Responsive.isMobile(context) || Responsive.isTablet(context) ? EdgeInsets.symmetric(horizontal: 24.0) : EdgeInsets.all(0.0),
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: widget.onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (!widget.isMobile)
                widget.isSelected
                    ? Positioned(
                        top: Sizes.SIZE_32,
                        child: SelectedIndicator(
                          width: _widthTitle(widget.title),
                        ),
                      )
                    : Positioned(
                        top: Sizes.SIZE_32,
                        child: AnimatedHoverIndicator(
                          isHover: _hovering,
                          width: _widthTitle(widget.title),
                        ),
                      ),
              Padding(
                padding: Responsive.isMobile(context) ?  EdgeInsets.all(2) : EdgeInsets.all(10.0),
                child: Text(
                  widget.title,
                  style: widget.titleStyle ??
                      textTheme.titleMedium?.copyWith(
                        fontSize: textSize,
                        color: widget.titleColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }

  double _widthTitle(String name){
    return name.length*7.5;
  }
}
