
import 'package:enreda_app/models/ability.dart';
import 'package:enreda_app/presentation/pages/home/sections/register_new_user/validating_form_controls/multi_select_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../services/database.dart';

Widget streamBuilder_Dropdown_Abilities (BuildContext context, Set<Ability> selectedAbilities) {
  final database = Provider.of<Database>(context, listen: false);
  return StreamBuilder<List<Ability>>(
      stream: database.abilityStream(),
      builder: (context, snapshotAbilities){

        List<MultiSelectDialogItem<Ability>> abilityItems = [];
        if (snapshotAbilities.hasData) {
          abilityItems = snapshotAbilities.data!.map( (Ability ability) =>
              MultiSelectDialogItem<Ability>(
                ability,
                ability.name
              ))
              .toList();
        }

        return MultiSelectDialog<Ability>(
          items: abilityItems,
          initialSelectedValues: selectedAbilities,
        );
      });
}
