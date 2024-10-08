import 'package:enreda_app/localization/LocaleProvider.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerLanguageButton extends StatelessWidget {
  DrawerLanguageButton();

  OverlayEntry? _overlayEntry;

  void _showOptions(BuildContext context, RenderBox button) {
    final overlay = Overlay.of(context);
    final size = button.size;
    final offset = button.localToGlobal(Offset.zero);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    var textTheme = Theme.of(context).textTheme;


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
            //width: 140,
            padding: EdgeInsets.only(right: 5, left: 5, top: 6, bottom: 6),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: hideOptions,
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(ImagePath.LOGO_EARTH)),
                  ),
                  SpaceW8(),
                  InkWell(
                    child: Text(
                      "ES",
                      maxLines: 1,
                      style: textTheme.titleLarge!.copyWith(
                        fontFamily: 'outfit',
                        fontWeight: localeProvider.locale == Locale('es') ?  FontWeight.w800 : FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.textBlue,
                      ),
                    ),
                    onTap: () {
                      localeProvider.setLocale(Locale('es'));
                      hideOptions();
                    },
                  ),
                  SpaceW8(),
                  InkWell(
                    child: Text(
                      "EN",
                      maxLines: 1,
                      style: textTheme.titleLarge!.copyWith(
                        fontFamily: 'outfit',
                        fontWeight: localeProvider.locale == Locale('en') ?  FontWeight.w800 : FontWeight.w400,
                        fontSize: 13,
                        color: AppColors.textBlue,
                      ),
                    ),
                    onTap: () {
                      localeProvider.setLocale(Locale('en'));
                      hideOptions();
                    },
                  ),
                  SpaceW8(),
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
                      hideOptions();
                    },
                  ),
                  SpaceW8(),
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
                      hideOptions();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void hideOptions() {
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
            hideOptions();
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
