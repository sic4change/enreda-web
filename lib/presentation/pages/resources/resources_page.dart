import 'package:enreda_app/models/city.dart';
import 'package:enreda_app/models/country.dart';
import 'package:enreda_app/models/filterResource.dart';
import 'package:enreda_app/models/filterTrainingPills.dart';
import 'package:enreda_app/models/organization.dart';
import 'package:enreda_app/models/province.dart';
import 'package:enreda_app/models/resource.dart';
import 'package:enreda_app/models/resourceCategory.dart';
import 'package:enreda_app/models/resourcePicture.dart';
import 'package:enreda_app/models/trainingPill.dart';
import 'package:enreda_app/models/userEnreda.dart';
import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/resources/sections/filter_text_field_row.dart';
import 'package:enreda_app/presentation/pages/resources/sections/resource_list_tile.dart';
import 'package:enreda_app/presentation/pages/resources/sections/show_resource_detail_dialog.dart';
import 'package:enreda_app/presentation/pages/trainingPills/training_list_tile.dart';
import 'package:enreda_app/presentation/pages/trainingPills/training_list_tile_mobile.dart';
import 'package:enreda_app/presentation/widgets/list_item_builder.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/presentation/widgets/list_item_grid_builder.dart';
import 'package:enreda_app/presentation/widgets/widgets/list_item_grid_vertical.dart';
import 'package:enreda_app/services/database.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResourcesPage extends StatefulWidget {
  @override
  State<ResourcesPage> createState() => _ResourcesPageState();

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
}

class _ResourcesPageState extends State<ResourcesPage> {
  final _searchTextController = TextEditingController();
  FilterResource filterResource = FilterResource("", "");
  FilterTrainingPill filterTrainingPill = FilterTrainingPill("", "");
  bool isAlertBoxOpened = false;
  List<ResourceCategory> resourceCategoriesList = [];
  String _categoryName = 'Empleo';
  String _categoryFormationId = '';
  String _backgroundImageUrl(String categoryId) {
    Map<String, String> backgroundImages = {
      "6ag9Px7zkFpHgRe17PQk": ImagePath.BACKGROUND_2,
      "FNAcayruXghBMjj3RD9h": ImagePath.BACKGROUND_6,
      "LNj2FMTEBsNtBYCRo0MQ": ImagePath.BACKGROUND_4,
      "POUBGFk5gU6c5X1DKo1b": ImagePath.BACKGROUND_1,
      "PlaaW4L4Z36Wu1V6HuBa": ImagePath.BACKGROUND_3,
      "zVusrwQkVoAca9R6iuQo": ImagePath.BACKGROUND_5,
    };
    return backgroundImages[categoryId] ?? "";
  }
  String _personImageUrl(String categoryId) {
    Map<String, String> personImages = {
      "6ag9Px7zkFpHgRe17PQk": ImagePath.PERSON_2,
      "FNAcayruXghBMjj3RD9h": ImagePath.PERSON_6,
      "LNj2FMTEBsNtBYCRo0MQ": ImagePath.PERSON_4,
      "POUBGFk5gU6c5X1DKo1b": ImagePath.PERSON_1,
      "PlaaW4L4Z36Wu1V6HuBa": ImagePath.PERSON_3,
      "zVusrwQkVoAca9R6iuQo": ImagePath.PERSON_5,
    };
    return personImages[categoryId] ?? "";
  }

  var bodyWidget = [];

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  getResourceCategories() {
    final database = Provider.of<Database>(context, listen: false);
    database.getCategoriesResources().listen((categoriesList) {
      setStateIfMounted(() => resourceCategoriesList = categoriesList);
    });
  }

  @override
  void initState() {
    super.initState();
    getResourceCategories();
    ResourcesPage.selectedIndex.value = 0;
  }


  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    bodyWidget = [
      _buildResourcesPage(context),
      _buildFilteredResourcesPage(context),
      _buildTrainingPills(context)
    ];

    return ValueListenableBuilder<int>(
        valueListenable: ResourcesPage.selectedIndex,
        builder: (context, selectedIndex, child) {
          return Scaffold(
            body: bodyWidget[selectedIndex],
          );
        });
  }


  Widget _buildResourcesPage(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.5, 0.9,],
                  colors: [
                    AppColors.white.withOpacity(0.1),
                    AppColors.greyViolet.withOpacity(0.1),
                    AppColors.turquoiseAlt,
                  ],
                ),
              ),
              child: Column(
                children: [
                  SpaceH50(),
                  Text( StringConst.SEARCH, style: textTheme.titleSmall?.copyWith(
                    color: AppColors.greyAlt,
                    height: 1.5,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    //fontSize: fontSize,
                  ),),
                  SpaceH20(),
                  Container(
                      alignment: Alignment.center,
                      padding: Responsive.isMobile(context) ?  EdgeInsets.symmetric(horizontal: 30) : EdgeInsets.symmetric(horizontal: 100.0),
                      child: Text(
                        Responsive.isMobile(context) ? StringConst.PILLS_SUBTITLE : StringConst.SEARCH_SUBTITLE,
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 15,),)),
                  SpaceH20(),
                  _buildCategories(context, resourceCategoriesList),
                  SpaceH30(),
                ],
              ),
            ),
            _buildTrainingPillsButton(context)
          ],
        ));
  }

  Widget _buildTrainingPillsButton(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: Responsive.isMobile(context)
          ? EdgeInsets.symmetric(horizontal: 30)
          : Responsive.isDesktopS(context)
          ? EdgeInsets.symmetric(horizontal: 30)
          : EdgeInsets.symmetric(horizontal: 100),
      height: Responsive.isMobile(context) ? 350 : Responsive.isDesktopS(context) ? 600 : 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setStateIfMounted(() {
                ResourcesPage.selectedIndex.value = 2;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: Responsive.isDesktop(context) ? EdgeInsets.only(top: 25) : EdgeInsets.zero,
                  height: Responsive.isMobile(context) ? 200 : Responsive.isDesktopS(context) ? 380 : 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ImagePath.BACKGROUND_PILLS),
                      )
                  ),
                ),
                Responsive.isDesktop(context) ? Positioned(
                  left: 100,
                  child: Container(
                    constraints:  BoxConstraints(
                        maxWidth: 400
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConst.PILLS_TITLE,
                          style: textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: Responsive.isMobile(context) ? 15 : Responsive.isDesktopS(context) ? 25 : 34,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SpaceH8(),
                        Text(StringConst.PILLS_SUBTITLE, style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: Responsive.isMobile(context) ? 12 : Responsive.isDesktopS(context) ? 15 : 18,
                        ),),
                      ],
                    ),
                  ),
                ) : Positioned(
                  top: 0,
                  child: Container(
                    constraints:  BoxConstraints(
                        maxWidth: Responsive.isMobile(context) ? 280 : 400
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: Responsive.isDesktop(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                        children: [
                          Text(StringConst.PILLS_TITLE,
                            style: textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: Responsive.isMobile(context) ? 15 : Responsive.isDesktopS(context) ? 25 : 34,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SpaceH8(),
                          Text(StringConst.PILLS_SUBTITLE,
                            textAlign: Responsive.isDesktop(context) ? TextAlign.left : TextAlign.center,
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: Responsive.isMobile(context) ? 12 : Responsive.isDesktopS(context) ? 15 : 18,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
                Responsive.isDesktop(context) ? Positioned(
                  bottom: 0,
                  right: 490,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          height: Responsive.isMobile(context) ? 100 : Responsive.isDesktopS(context) ? 220 : 280,
                          child: Image.asset(ImagePath.PERSON_PILL1)),
                    ],
                  ),
                ) : Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          height: Responsive.isMobile(context) ? 100 : Responsive.isDesktopS(context) ? 220 : 280,
                          child: Image.asset(ImagePath.PERSON_PILL1)),
                    ],
                  ),
                ),
                Responsive.isDesktop(context) ? Positioned(
                  bottom: 0,
                  right: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          height: Responsive.isMobile(context) ? 100 : Responsive.isDesktopS(context) ? 220 : 290,
                          child: Image.asset(ImagePath.PERSON_PILL3)),
                    ],
                  ),
                ) : Positioned(
                  bottom: 0,
                  right: MediaQuery.of(context).size.width * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          height: Responsive.isMobile(context) ? 100 : Responsive.isDesktopS(context) ? 220 : 290,
                          child: Image.asset(ImagePath.PERSON_PILL3)),
                    ],
                  ),
                ),
                Responsive.isDesktop(context) ? Positioned(
                  bottom: 0,
                  right: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          height: Responsive.isMobile(context) ? 120 : Responsive.isDesktopS(context) ? 280 : 350,
                          child: Image.asset(ImagePath.PERSON_PILL2)),
                    ],
                  ),
                ) : Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          height: Responsive.isMobile(context) ? 120 : Responsive.isDesktopS(context) ? 280 : 350,
                          child: Image.asset(ImagePath.PERSON_PILL2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilteredResourcesPage(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final isBigScreen = MediaQuery.of(context).size.width >= 900;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              FilterTextFieldRow(
                searchTextController: _searchTextController,
                onPressed: () => setStateIfMounted(() {
                  filterResource.searchText = _searchTextController.text;
                }),
                onFieldSubmitted: (value) => setStateIfMounted(() {
                  filterResource.searchText = _searchTextController.text;
                }),
                clearFilter: () => _clearFilter(),
                hintText: 'Nombre del recurso, organizador, país...',
              ),
              SpaceH20(),
              Padding(
                padding: Responsive.isMobile(context)
                    ? EdgeInsets.symmetric(horizontal: 15)
                    : Responsive.isDesktopS(context)
                    ? EdgeInsets.symmetric(horizontal: 30)
                    : EdgeInsets.symmetric(horizontal: 100),
                child: InkWell(
                  onTap: () {
                    setStateIfMounted(() {
                      ResourcesPage.selectedIndex.value = 0;
                      _clearFilter();
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, color: AppColors.primaryColor),
                      SpaceW12(),
                      Text(_categoryName, style: textTheme.titleSmall?.copyWith(
                        color: AppColors.greyAlt,
                        height: 1.5,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w700,
                        fontSize:  isBigScreen ? 25 : 20,
                        //fontSize: fontSize,
                      ),),
                    ],
                  ),
                ),
              ),
              SpaceH20(),
              _categoryFormationId == "6ag9Px7zkFpHgRe17PQk" ?
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: Responsive.isMobile(context)
                          ? EdgeInsets.symmetric(horizontal: 20)
                          : Responsive.isDesktopS(context)
                          ? EdgeInsets.symmetric(horizontal: 30)
                          : EdgeInsets.symmetric(horizontal: 100),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => launchURL(StringConst.WEB_FUNDAULA_ACCESS),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0.6, 1,],
                                  colors: [
                                    AppColors.lightPurple,
                                    AppColors.ultraLightPurple,
                                  ],
                                ),
                                color: AppColors.lightPurple,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.darkPurple,
                                    offset: Offset(8.0, -8.0),
                                    blurRadius: 0.0,
                                  ),
                                ],
                              ),
                              padding: Responsive.isMobile(context)
                                  ? EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0)
                                  : EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 15.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        StringConst.FUNDAULA_BUTTON,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: textTheme.bodySmall?.copyWith(
                                          color: Colors.white,
                                          height: 1.5,
                                          letterSpacing: 1,
                                          fontSize: Responsive.isMobile(context) ? 10 : Responsive.isDesktopS(context) ? 14 : 16,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                  SpaceW8(),
                                  Image.asset(ImagePath.LOGO_FUNDAULA, height: isBigScreen ? 30 : Responsive.isMobile(context) ? 20 : 25,),
                                  isBigScreen ? SpaceW30() : SpaceW24(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: isBigScreen ? 120 : 25,
                        bottom: 0,
                        child: Image.asset(ImagePath.ICON_CLICK_FUNDAULA, height: isBigScreen ? 40 : 30,)),
                  ],
                ),
              ) : Container(),
            ],
          ),
        ),
        Container(
          margin: _categoryFormationId == "6ag9Px7zkFpHgRe17PQk"
              ? EdgeInsets.only(top: 100.0)
              : Responsive.isMobile(context) ? EdgeInsets.only(top: 20.0, right: 0, left: 0) : EdgeInsets.only(top: 0.0, right: 20, left: 20),
          child: _buildContents(context),
        ),
      ],
    );
  }

  Widget _buildTrainingPills(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final isBigScreen = MediaQuery.of(context).size.width >= 900;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              FilterTextFieldRow(
                searchTextController: _searchTextController,
                onPressed: () => setStateIfMounted(() {
                  filterTrainingPill.searchText = _searchTextController.text;
                }),
                onFieldSubmitted: (value) => setStateIfMounted(() {
                  filterTrainingPill.searchText = _searchTextController.text;
                }),
                clearFilter: () => _clearFilter(),
                hintText: 'Nombre del video, categoría...',
              ),
              SpaceH20(),
              Padding(
                padding: Responsive.isMobile(context)
                    ? EdgeInsets.symmetric(horizontal: 15)
                    : Responsive.isDesktopS(context)
                    ? EdgeInsets.symmetric(horizontal: 30)
                    : EdgeInsets.symmetric(horizontal: 100),
                child: InkWell(
                  onTap: () {
                    setStateIfMounted(() {
                      ResourcesPage.selectedIndex.value = 0;
                      _clearFilter();
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, color: AppColors.primaryColor),
                      SpaceW12(),
                      Text('Píldoras formativas', style: textTheme.titleSmall?.copyWith(
                        color: AppColors.greyAlt,
                        height: 1.5,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w700,
                        fontSize:  isBigScreen ? 25 : 20,
                        //fontSize: fontSize,
                      ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: !kIsWeb ? EdgeInsets.only(top: 120.0) : EdgeInsets.only(top: 120.0),
            child: Responsive.isMobile(context) || Responsive.isMobileHorizontal(context) ?
            _buildTrainingPillsListMobile(context)
                : _buildTrainingPillsList(context)),
      ],
    );
  }

  Widget _buildCategories(BuildContext context, List<ResourceCategory> resourceCategories) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GridView.builder(
      padding: Responsive.isMobile(context)
          ? EdgeInsets.symmetric(horizontal: 30)
          : Responsive.isDesktopS(context)
          ? EdgeInsets.symmetric(horizontal: 30, vertical: 30)
          : EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      shrinkWrap: true,
      itemCount: resourceCategories.length,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: Responsive.isMobile(context) ? 280 : 520,
          mainAxisExtent: Responsive.isMobile(context) ? 120 : 450,
          crossAxisSpacing: Responsive.isMobile(context) ? 15 : 30,
          mainAxisSpacing: Responsive.isMobile(context) ? 15 : 30
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setStateIfMounted(() {
              filterResource.resourceCategoryId = (resourceCategories[index].id);
              ResourcesPage.selectedIndex.value = 1;
              _categoryName = resourceCategories[index].name;
              _categoryFormationId = resourceCategories[index].id;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundImageUrl(resourceCategories[index].id)),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0,
                  child: Padding(
                    padding: Responsive.isMobile(context) ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 25.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: Responsive.isMobile(context) ? 150 : 300,
                      ),
                      child: Text(resourceCategories[index].name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: Responsive.isMobile(context) ? 15 : Responsive.isDesktopS(context) ? 25 : 34,
                          fontWeight: FontWeight.w900,
                        ),),
                    ),
                  ),
                ),
                Padding(
                  padding: Responsive.isMobile(context) ? EdgeInsets.only(top: 35.0) : EdgeInsets.only(top: 60),
                  child: Image.asset(_personImageUrl(resourceCategories[index].id)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTrainingPillsList(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return Container(
      padding: Responsive.isMobile(context)
          ? EdgeInsets.symmetric(horizontal: 10)
          : Responsive.isDesktopS(context)
          ? EdgeInsets.symmetric(horizontal: 20, vertical: 30)
          : EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: StreamBuilder<List<TrainingPill>>(
          stream: database.filteredTrainingPillStream(filterTrainingPill),
          builder: (context, snapshot) {
            return ListItemBuilderGrid<TrainingPill>(
                snapshot: snapshot,
                maxCrossAxisExtentValue: 490,
                mainAxisExtentValue: Responsive.isMobile(context) ? 305 : Responsive.isDesktopS(context) ? 480 : 500,
                itemBuilder: (context, trainingPill) {
                  trainingPill.setTrainingPillCategoryName();
                  return Container(
                    key: Key('trainingPill-${trainingPill.id}'),
                    child: TrainingPillListTile(
                      trainingPill: trainingPill,
                    ),
                  );
                }
            );
          }),
    );
  }

  Widget _buildTrainingPillsListMobile(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder<List<TrainingPill>>(
            stream: database.filteredTrainingPillStream(filterTrainingPill),
            builder: (context, snapshot) {
              return ListItemBuilderVertical<TrainingPill>(
                snapshot: snapshot,
                itemBuilder: (context, trainingPill) {
                  trainingPill.setTrainingPillCategoryName();
                  return Container(
                    key: Key('trainingPill-${trainingPill.id}'),
                    child: Column(
                      children: [
                        TrainingPillsListTileMobile(
                          trainingPill: trainingPill,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(thickness: 1.5),
                        ),
                      ],
                    ),
                  );
                },
                emptyTitle: 'Sin píldoras formativas',
                emptyMessage: 'No tenemos videos que mostrarte con la búsqueda',
              );
            }),
      ),
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
              child: ListItemBuilderGrid<Resource>(
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
    setStateIfMounted(() {
      _searchTextController.clear();
      filterResource.searchText = '';
      filterTrainingPill.searchText = '';
    });
  }
}

