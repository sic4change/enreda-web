import 'package:enreda_app/models/competency.dart';
import 'package:enreda_app/presentation/pages/resources/streams/wrap_builder_list.dart';
import 'package:enreda_app/presentation/widgets/widgets/custom_text_title.dart';
import 'package:enreda_app/services/database.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompetenciesByResource extends StatelessWidget {
  const CompetenciesByResource({required this.competenciesIdList});

  final List<String?> competenciesIdList;

  @override
  Widget build(BuildContext context) {
    return _buildContents(context);
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Competency>>(
        stream: database.competenciesStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            // Pre-process to determine if there are any matches
            bool foundMatch = snapshot.data!.any((competency) => competenciesIdList.contains(competency.id));

            // If no matches are found, display the message.
            if (!foundMatch) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'El recurso aun no tiene competencias.',
                  style: TextStyle(
                    color: AppColors.greyTxtAlt,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            // Continue with the original logic since we have at least one match
            return WrapBuilderList<Competency>(
              snapshot: snapshot,
              itemBuilder: (context, competency) {
                if (competenciesIdList.contains(competency.id)) {
                  return Container(
                      key: Key('resource-${competency.id}'),
                      child: Container(
                          margin: const EdgeInsets.only(left: 0, right: 4, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.greyLight.withOpacity(0.2), width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                            child: CustomText(title: competency.name),
                          )
                      )
                  );
                }
                return Container(); // Returning an empty container for non-matching items
              },
            );
          }
          return CustomTextTitle(
              title: '¡El recurso aun no tiene competencias!');
        });
  }
}
