
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../layout/adaptive.dart';

class OurTeamCard extends StatefulWidget {
  const OurTeamCard({required this.name, required this.image, required this.text, required this.position});

  final String name;
  final String image;
  final String text;
  final String position;

  @override
  State<OurTeamCard> createState() => _OurTeamCardState();
}

class _OurTeamCardState extends State<OurTeamCard> {

  bool _hoverCard = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: MouseRegion(
        onEnter: (value){
          setState(() {
            _hoverCard = true;
          });
        },
        onExit: (value){
          setState(() {
            _hoverCard = false;
          });
        },
        child: Container(
          height: 535,
          width: Responsive.isMobile(context) ? widthOfScreen(context) : widthOfScreen(context)/5,
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30, right: 30, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontSize: 30,
                        color: AppColors.textBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 220,
                        width: 180,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _hoverCard ? AppColors.yellowDark : AppColors.buttonBlue
                                  )
                                ),
                              Positioned(
                                bottom: widget.name == 'Morelia' ? -36 : -10,
                                child: Container(
                                  height: 230,
                                  width: widget.name == 'Morelia' ? 160 : 180,
                                  child: Image.asset(widget.image)
                                ),
                              )
                            ],
                          ),
                        ),
                        ),
                    ),
                  ],
                ),
                SpaceH12(),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 14,
                    color: AppColors.greyTxtAlt,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        widget.position,
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: 14,
                          color: _hoverCard ? AppColors.yellowDark : AppColors.buttonBlue,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
