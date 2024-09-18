import 'package:enreda_app/localization/LocaleProvider.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderLanguageButton extends StatelessWidget {
  HeaderLanguageButton();

  OverlayEntry? _overlayEntry;

  void _showOptions(BuildContext context, RenderBox button) {
    final overlay = Overlay.of(context);
    final size = button.size;
    final offset = button.localToGlobal(Offset.zero);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy, //+ size.height,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(19)),
              border: Border.all(
                color: AppColors.blueLanguage, // Color del borde
                width: 1.0, // Ancho del borde en píxeles
              ),
            ),
            width: 38,
            padding: EdgeInsets.only(right: 6.0, left: 6, top: 6, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: _hideOptions,
                  child: Container(
                    width: 24,
                    height: 24,
                    child: Image.asset(ImagePath.LOGO_EARTH)),
                ),
                SpaceH4(),
                InkWell(
                  child: Text(
                    "ES",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: 14,
                      fontWeight: localeProvider.locale == Locale('es') ?  FontWeight.w800 : FontWeight.w400,
                      color: AppColors.blueLanguage,
                    ),
                  ),
                  onTap: () {
                    localeProvider.setLocale(Locale('es'));
                    _hideOptions();
                  },
                ),
                //SpaceH2(),
                InkWell(
                  child: Text(
                    "EN",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: 13,
                      fontWeight: localeProvider.locale == Locale('en') ?  FontWeight.w800 : FontWeight.w400,
                      color: AppColors.blueLanguage,
                    ),
                  ),
                  onTap: () {
                    localeProvider.setLocale(Locale('en'));
                    _hideOptions();
                  },
                ),
                InkWell(
                  child: Text(
                    "FR",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDivider,
                    ),
                  ),
                  onTap: () {
                    // Lógica para la opción 2
                    _hideOptions();
                  },
                ),
                InkWell(
                  child: Text(
                    "AR",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDivider,
                    ),
                  ),
                  onTap: () {
                    // Lógica para la opción 2
                    _hideOptions();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _hideOptions() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: //onTap,
        (){
          if(_overlayEntry != null){
            _hideOptions();
          } else{
            final button = context.findRenderObject() as RenderBox;
            _showOptions(context, button);
          }

        },
        child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.blueLanguage, // Color del borde
              width: 1.0, // Ancho del borde en píxeles
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: 24,
              width: 24,
              child: Image.asset(ImagePath.LOGO_EARTH)),
          ),
        ),
        /*Text(
          text,
          style: GoogleFonts.inter(
              letterSpacing: .4,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textBlue
          ),
        ),*/
      ),
    );
  }
}
