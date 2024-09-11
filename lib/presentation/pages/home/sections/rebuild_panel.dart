import 'package:enreda_app/presentation/pages/home/sections/statistics_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/responsive.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';

const double kSpacingSm = 40.0;
const double kRunSpacingSm = 24.0;
const double kSpacingLg = 24.0;
const double kRunSpacingLg = 16.0;

class RebuildPanel extends StatefulWidget {
  RebuildPanel({Key? key});
  @override
  _RebuildPanelState createState() => _RebuildPanelState();
}

class _RebuildPanelState extends State<RebuildPanel> {
  bool _cardEnableSIC = false;
  bool _cardEnableKieu = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Responsive.isMobile(context) ? screenHeight : contentAreaHeightSm,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
        child:
        Responsive.isMobile(context) ?
        _buildMobilePage(context) :
        _buildWebPage(context),

      );
  }

  Widget _buildWebPage(BuildContext context){
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  width: widthOfScreen(context),
                  color: AppColors.lightBlue,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _cardEnableSIC = false;
                              _cardEnableKieu = false;
                            });
                          },
                          child: Container(
                              width: widthOfScreen(context)*0.8,
                              child: Image.asset(ImagePath.REBUILD_MAP)
                          ),
                        ),
                        Positioned( //SIC
                          right: widthOfScreen(context)*0.51,
                          bottom: 70,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                if(_cardEnableKieu){
                                  _cardEnableKieu = false;
                                }
                                _cardEnableSIC = !_cardEnableSIC;
                              });
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Positioned( //Kieu
                          right: widthOfScreen(context)*0.38,
                          bottom: widthOfScreen(context)*0.22,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                if(_cardEnableSIC){
                                  _cardEnableSIC = false;
                                }
                                _cardEnableKieu = !_cardEnableKieu;
                              });
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              color: Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: widthOfScreen(context),
                  height: 600,
                  color: AppColors.textBlue,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0, top:100),
                    child: StatisticsSection(),
                  ),
                ),
              ],
            ),
            (_cardEnableKieu || _cardEnableSIC) ? Positioned(
              right: widthOfScreen(context)*0.1,
              top:100,
              bottom: 700,
              child: Container(
                  width: widthOfScreen(context)*0.2,
                  child: Image.asset(_cardEnableSIC ? ImagePath.REBUILD_CARD_ITEM : ImagePath.REBUILD_CARD_ITEM_2)
              ),
            ) : Container(),
            Positioned(
              bottom: 500,
              child: Container(
                  width: widthOfScreen(context)-200,
                  child: Image.asset(ImagePath.REBUILD_TITLE_IMAGE)
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget _buildMobilePage(BuildContext context){
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      _cardEnableSIC = !_cardEnableSIC;
                    });
                  },
                  child: Container(
                    width: widthOfScreen(context),
                    color: AppColors.lightBlue,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _cardEnableSIC = false;
                                _cardEnableKieu = false;
                              });
                            },
                            child: Container(
                                width: widthOfScreen(context)*0.95,
                                child: Image.asset(ImagePath.REBUILD_MAP)
                            ),
                          ),
                          Positioned( //SIC
                            right: widthOfScreen(context)*0.51,
                            bottom: 10,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  if(_cardEnableKieu){
                                    _cardEnableKieu = false;
                                  }
                                  _cardEnableSIC = !_cardEnableSIC;
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Positioned( //Kieu
                            right: widthOfScreen(context)*0.38,
                            bottom: widthOfScreen(context)*0.22,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  if(_cardEnableSIC){
                                    _cardEnableSIC = false;
                                  }
                                  _cardEnableKieu = !_cardEnableKieu;
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                color: Colors.transparent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: widthOfScreen(context),
                  height: 1250,
                  color: AppColors.textBlue,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: StatisticsSection()
                  ),
                ),
              ],
            ),
            (_cardEnableKieu || _cardEnableSIC) ? Positioned(
              left: 260,
              right: 50,
              top: 30,
              bottom: 1300,
              child: Container(
                  width: 200,
                  //height: 300,
                  child: Image.asset(_cardEnableSIC ? ImagePath.REBUILD_CARD_ITEM : ImagePath.REBUILD_CARD_ITEM_2)
              ),
            ) : Container(),
            Positioned(
              bottom: 1230,
              child: Container(
                  width: widthOfScreen(context)-60,
                  child: Image.asset(ImagePath.REBUILD_TITLE_IMAGE)
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget numberCountTile(int num, String text, Color color){
    return Container(
      height: 380,
      width: widthOfScreen(context)/5,
      decoration:  BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          const Radius.circular(60.0),
        ),
        border: Border.all(
          color: color,
          width: 2,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              num.toString(),
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.outfit().fontFamily,
                color: color,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.outfit().fontFamily,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget numberCountTileMobile(int num, String text, Color color){
    double fontSizeTitle = responsiveSize(context, 50, 80);
    double fontSizeBody = responsiveSize(context, 20, 26);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Container(
        height: 250,
        width: widthOfScreen(context)-120,
        decoration:  BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              const Radius.circular(60.0),
            ),
            border: Border.all(
              color: color,
              width: 2,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                num.toString(),
                style: TextStyle(
                  fontSize: fontSizeTitle,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  color: color,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: fontSizeBody,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
