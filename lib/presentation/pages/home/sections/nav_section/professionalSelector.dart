import 'package:enreda_app/localization/LocaleProvider.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfessionalSelector extends StatelessWidget {
  ProfessionalSelector();

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
        top: offset.dy + size.height*2,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(7)),
              border: Border.all(
                color: AppColors.greyDivider, // Color del borde
                width: 1.0, // Ancho del borde en píxeles
              ),
            ),
            width: size.width,
            //height: 65,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  child: Text(
                    AppLocalizations.of(context)!.iAmEntity.toUpperCase(),
                    maxLines: 1,
                    style: textTheme.titleLarge!.copyWith(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.textBlue,
                    ),
                  ),
                  onTap: () {
                    openUrlLink(StringConst.SOCIAL_ENTITY_URL);
                    _hideOptions();
                  },
                ),
                SpaceH4(),
                InkWell(
                  child: Text(
                    AppLocalizations.of(context)!.iAmCompany.toUpperCase(),
                    maxLines: 1,
                    style: textTheme.titleLarge!.copyWith(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyDivider,
                    ),
                  ),
                  onTap: () {
                    //localeProvider.setLocale(Locale('en'));
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
    var textTheme = Theme.of(context).textTheme;
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
        child: Text(
          AppLocalizations.of(context)!.professionalAccount.toUpperCase(),
          style: textTheme.titleLarge!.copyWith(
            fontFamily: GoogleFonts.outfit().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlue,
          ),

          /*TextStyle(
            fontFamily: GoogleFonts.outfit().fontFamily,
            fontWeight: FontWeight.w800,
            fontSize: 16,
            color: AppColors.textBlue,
          ),*/
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