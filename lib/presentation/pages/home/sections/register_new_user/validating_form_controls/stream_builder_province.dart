
import 'package:enreda_app/models/country.dart';
import 'package:enreda_app/models/province.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';


Widget streamBuilderForProvince (BuildContext context, Country? selectedCountry, Province? selectedProvince,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<Province>>(
      stream: database.provincesCountryStream(selectedCountry?.countryId),
      builder: (context, snapshotProvinces) {

        List<DropdownMenuItem<Province>> provinceItems = [];
        if (snapshotProvinces.hasData && selectedCountry != null) {
          provinceItems = snapshotProvinces.data!.map((Province p) =>
              DropdownMenuItem<Province>(
                value: p,
                child: Text(p.name),
              )
          ).toList();
        }

        return DropdownButtonFormField<Province>(
            hint: Text(StringConst.FORM_PROVINCE),
            isExpanded: true,
            value: selectedProvince,
            items: provinceItems,
            validator: (value) => selectedProvince != null ?
                                    null : StringConst.PROVINCE_ERROR,
            onChanged: (value) => functionToWriteBackThings(value),
            iconDisabledColor: AppColors.greyLightTxt,
            iconEnabledColor: AppColors.turquoise,
          decoration: InputDecoration(
            labelStyle: textTheme.bodyText1?.copyWith(
              height: 1.5,
              color: AppColors.greyDark,
              fontWeight: FontWeight.w400,
              fontSize: fontSize,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppColors.greyUltraLight,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppColors.greyUltraLight,
                width: 1.0,
              ),
            ),
          ),
          style: textTheme.bodyText1?.copyWith(
            height: 1.5,
            fontWeight: FontWeight.w700,
            color: AppColors.greyDark,
            fontSize: fontSize,
          ),
        );
      }
  );
}
