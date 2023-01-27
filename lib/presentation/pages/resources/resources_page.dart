import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:enreda_app/models/city.dart';
import 'package:enreda_app/models/country.dart';
import 'package:enreda_app/models/filterResource.dart';
import 'package:enreda_app/models/organization.dart';
import 'package:enreda_app/models/province.dart';
import 'package:enreda_app/models/resource.dart';
import 'package:enreda_app/models/resourcePicture.dart';
import 'package:enreda_app/models/userEnreda.dart';
import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/resources/sections/show_resource_detail_dialog.dart';
import 'package:enreda_app/presentation/pages/resources/sections/filter_text_field_row.dart';
import 'package:enreda_app/presentation/pages/resources/sections/resource_list_tile.dart';
import 'package:enreda_app/presentation/widgets/list_item_builder.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/services/database.dart';
import 'package:enreda_app/utils/const.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/responsive.dart';

class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  FilterResource filterResource = FilterResource(
    "",
    [],
  );
  bool isAlertboxOpened = false;
  final _searchTextController = TextEditingController();

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(() {
      filterResource.searchText = _searchTextController.text;
    });
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _searchTextController.text = filterResource.searchText;
    double padding = responsiveSize(context, 15, 70, md: 30);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Constants.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 156),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: Responsive.isMobile(context) ? 0 : 30.0, right: padding, left: padding),
            child: _buildFilterRow(),
          ),
        ),
      ),
      body: _buildContents(context),
    );
  }

  Widget _buildFilterRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterTextFieldRow(
            searchTextController: _searchTextController,
            onPressed: () => setState(() {
                  filterResource.searchText = _searchTextController.text;
                }),
            onFieldSubmitted: (value) => setState(() {
                  filterResource.searchText = _searchTextController.text;
                }),
            clearFilter: () => _clearFilter()),
        Responsive.isMobile(context) ? SpaceH4() : SpaceH16(),
        Container(
          color: Colors.transparent,
          height: Responsive.isMobile(context) ? 50 : 60.0,
          child: ChipsChoice<String>.multiple(
            alignment: WrapAlignment.start,
            value: filterResource.resourceTypes,
            onChanged: (val) {
              setState(() {
                filterResource.resourceTypes = val;
              });
            },
            choiceItems: C2Choice.listFrom<String, String>(
              source: StringConst.RESOURCE_TYPES,
              value: (i, v) => v,
              label: (i, v) => v,
            ),
            choiceStyle: C2ChoiceStyle(
              padding: Responsive.isMobile(context) ? EdgeInsets.all(8.0) : EdgeInsets.all(15.0),
              color: AppColors.greyViolet,
              borderColor: AppColors.greyViolet,
              backgroundColor: AppColors.greyLight,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            choiceActiveStyle: C2ChoiceStyle(
              padding: Responsive.isMobile(context) ? EdgeInsets.all(8.0) : EdgeInsets.all(15.0),
              color: Colors.white,
              backgroundColor: AppColors.greyViolet,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            runSpacing: 4,
          ),
        ),
      ],
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    double padding = responsiveSize(context, 15, 70, md: 30);
    return Container(
      padding: EdgeInsets.only(top: Responsive.isMobile(context) ? 100 : 180.0, right: padding, left: padding, bottom: 30.0),
      child: StreamBuilder<List<Resource>>(
          stream: database.filteredResourcesStream(filterResource),
          builder: (context, snapshot) {
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListItemBuilder<Resource>(
                snapshot: snapshot,
                itemBuilder: (context, resource) {
                  if (resource.organizerType == 'Organización') {
                    return StreamBuilder<Organization>(
                      stream: database.organizationStream(resource.organizer),
                      builder: (context, snapshot) {
                        final organization = snapshot.data;
                        resource.organizerName =
                            organization == null ? '' : organization.name;
                        resource.organizerImage =
                            organization == null ? '' : organization.photo;
                        resource.setResourceTypeName();
                        return StreamBuilder<Country>(
                            stream: database.countryStream(resource.country),
                            builder: (context, snapshot) {
                              final country = snapshot.data;
                              resource.countryName =
                                  country == null ? '' : country.name;
                              return StreamBuilder<Province>(
                                stream:
                                    database.provinceStream(resource.province),
                                builder: (context, snapshot) {
                                  final province = snapshot.data;
                                  resource.provinceName =
                                      province == null ? '' : province.name;
                                  return StreamBuilder<City>(
                                      stream: database.cityStream(resource.city),
                                      builder: (context, snapshot) {
                                        final city = snapshot.data;
                                        resource.cityName =
                                            city == null ? '' : city.name;
                                        return StreamBuilder<ResourcePicture>(
                                            stream:
                                                database.resourcePictureStream(
                                                    resource.resourcePictureId),
                                            builder: (context, snapshot) {
                                              final resourcePicture =
                                                  snapshot.data;
                                              resource.resourcePhoto =
                                                  resourcePicture == null
                                                      ? resource.resourcePhoto
                                                      : resourcePicture
                                                          .resourcePhoto;
                                              return Container(
                                                key: Key(
                                                    'resource-${resource.resourceId}'),
                                                child: ResourceListTile(
                                                    resource: resource,
                                                    onTap: () => showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) => ShowResourceDetailDialog(
                                                        resource: resource,
                                                      ),
                                                    ),
                                                ),
                                              );
                                            });
                                      });
                                },
                              );
                            });
                      },
                    );
                  } else {
                    return StreamBuilder<UserEnreda>(
                      stream: database.mentorStream(resource.organizer),
                      builder: (context, snapshot) {
                        final mentor = snapshot.data;
                        resource.organizerName = mentor == null
                            ? ''
                            : '${mentor.firstName} ${mentor.lastName} ';
                        resource.organizerImage =
                            mentor == null ? '' : mentor.photo;
                        resource.setResourceTypeName();
                        return StreamBuilder<Country>(
                            stream: database.countryStream(resource.country!),
                            builder: (context, snapshot) {
                              final country = snapshot.data;
                              resource.countryName =
                                  country == null ? '' : country.name;
                              return StreamBuilder<Province>(
                                stream:
                                    database.provinceStream(resource.province!),
                                builder: (context, snapshot) {
                                  final province = snapshot.data;
                                  resource.provinceName =
                                      province == null ? '' : province.name;
                                  return StreamBuilder<City>(
                                      stream: database.cityStream(resource.city!),
                                      builder: (context, snapshot) {
                                        final city = snapshot.data;
                                        resource.cityName =
                                            city == null ? '' : city.name;
                                        return StreamBuilder<ResourcePicture>(
                                            stream:
                                                database.resourcePictureStream(
                                                    resource.resourcePictureId),
                                            builder: (context, snapshot) {
                                              final resourcePicture =
                                                  snapshot.data;
                                              resource.resourcePhoto =
                                                  resourcePicture == null
                                                      ? resource.resourcePhoto
                                                      : resourcePicture
                                                          .resourcePhoto;
                                              return Container(
                                                key: Key(
                                                    'resource-${resource.resourceId}'),
                                                child: ResourceListTile(
                                                  resource: resource,
                                                  // onTap: () =>
                                                  //     showResourceDetailDialog(
                                                  //         context: context,
                                                  //         resource: resource),
                                                  onTap: () => showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) => ShowResourceDetailDialog(
                                                      resource: resource,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      });
                                },
                              );
                            });
                      },
                    );
                  }
                },
                emptyTitle: 'Sin recursos',
                emptyMessage: 'Aún no tenemos recursos que mostrarte',
              ),
            );
          }),
    );
  }

  void _clearFilter() {
    setState(() {
      _searchTextController.clear();
      filterResource.resourceTypes.clear();
    });
  }
}
