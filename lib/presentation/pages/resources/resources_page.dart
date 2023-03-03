import 'package:chips_choice/chips_choice.dart';
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
import 'package:enreda_app/utils/my_scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/resourceCategory.dart';
import '../../../utils/responsive.dart';
import '../../widgets/custom_chip.dart';




class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  FilterResource filterResource = FilterResource("", [],);
  bool isAlertboxOpened = false;
  final _searchTextController = TextEditingController();
  List<ResourceCategory> resourceCategoriesList = [];

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  getResourceCategories() {
    final database = Provider.of<Database>(context, listen: false);
    database.getCategoriesResources().listen((categoriesList) {
      setState(() => resourceCategoriesList = categoriesList);
    });
  }

  @override
  void initState() {
    super.initState();
    getResourceCategories();
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
    final double margin = Responsive.isDesktop(context) ? 20.0 : 12.0;
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
          height: 50.0,
          child:
          resourceCategoriesList.isEmpty ? Center(child: LinearProgressIndicator()) :
          ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ChipsChoice<String>.multiple(
              alignment: WrapAlignment.start,
              padding: EdgeInsets.only(left: 0.0, right: 0.0),
              value: filterResource.resourceCategories,
              onChanged: (val) {
                setState(() {
                  filterResource.resourceCategories = val;
                });
              },
              choiceItems: C2Choice.listFrom<String, ResourceCategory>(
                source: resourceCategoriesList,
                value: (i, v) => v.id,
                label: (i, v) => v.name,
              ),
              choiceBuilder: (item, i) => Row(
                children: [
                  CustomChip(
                    label: item.label,
                    selected: item.selected,
                    onSelect: item.select!,
                  ),
                  SpaceW8(),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    double padding = responsiveSize(context, 15, 70, md: 30);
    return Container(
      padding: EdgeInsets.only(top: Responsive.isMobile(context) ? 100 : 150.0, right: padding, left: padding, bottom: 30.0),
      child: StreamBuilder<List<Resource>>(
          stream: database.filteredResourcesCategoryStream(filterResource),
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
      filterResource.searchText = '';
      filterResource.resourceCategories = [];
    });
  }
}
