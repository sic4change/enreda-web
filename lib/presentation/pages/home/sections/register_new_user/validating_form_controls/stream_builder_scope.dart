
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../models/scope.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget streamBuilderForScope (BuildContext context, Scope? selectedScope,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<Scope>>(
      stream: database.scopeStream(),
      builder: (context, snapshotScopes){

        List<DropdownMenuItem<Scope>> scopeItems = [];
        if (snapshotScopes.hasData) {
          scopeItems = snapshotScopes.data!.map((Scope scope) => DropdownMenuItem<Scope>(
            value: scope,
            child: Text(scope.label),
          ))
              .toList();
        }

        return DropdownButtonFormField<Scope>(
          hint: Text(StringConst.FORM_SCOPE),
          isExpanded: true,
          value: selectedScope,
          items: scopeItems,
          validator: (value) => selectedScope != null ? null : StringConst.FORM_SCOPE_ERROR,
          onChanged: (value) => functionToWriteBackThings(value),
          iconDisabledColor: AppColors.greyLightTxt,
          iconEnabledColor: AppColors.turquoise,
          decoration: InputDecoration(
            labelStyle: textTheme.bodyMedium?.copyWith(
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
          style: textTheme.bodyMedium?.copyWith(
            height: 1.5,
            fontWeight: FontWeight.w700,
            color: AppColors.greyDark,
            fontSize: fontSize,
          ),
        );
      });
}