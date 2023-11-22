import 'package:enreda_app/models/ability.dart';
import 'package:enreda_app/models/dedication.dart';
import 'package:enreda_app/models/education.dart';
import 'package:enreda_app/models/filterTrainingPills.dart';
import 'package:enreda_app/models/mentorUser.dart';
import 'package:enreda_app/models/nature.dart';
import 'package:enreda_app/models/resourcePicture.dart';
import 'package:enreda_app/models/size.dart';
import 'package:enreda_app/models/specificinterest.dart';
import 'package:enreda_app/models/timeSearching.dart';
import 'package:enreda_app/models/timeSpentWeekly.dart';
import 'package:enreda_app/models/filterResource.dart';
import 'package:enreda_app/models/trainingPill.dart';
import 'package:enreda_app/utils/functions.dart';

import '../models/city.dart';
import '../models/contact.dart';
import '../models/country.dart';
import '../models/gender.dart';
import '../models/interest.dart';
import '../models/organization.dart';
import '../models/organizationUser.dart';
import '../models/province.dart';
import '../models/resource.dart';
import '../models/resourceCategory.dart';
import '../models/scope.dart';
import '../models/test.dart';
import '../models/unemployedUser.dart';
import '../models/userEnreda.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Stream<List<UserEnreda>> youngsStream();
  Stream<Resource> resourceStream(String resourceId);
  Stream<List<Resource>> resourcesStream();
  //Stream<List<Resource>> filteredResourcesStream(FilterResource filter);
  Stream<List<Resource>> filteredResourcesCategoryStream(FilterResource filter);
  Stream<List<ResourceCategory>> getCategoriesResources();
  Stream<List<Organization>> organizationsStream();
  Stream<Organization> organizationStream(String organizationId);
  Stream<UserEnreda> mentorStream(String mentorId);
  Stream<List<Country>> countriesStream();
  Stream<List<Country>> countryFormatedStream();
  Stream<Country> countryStream(String? countryId);
  Stream<List<Province>> provincesStream();
  Stream<Province> provinceStream(String? provinceId);
  Stream<List<Province>> provincesCountryStream(String? countryId);
  Stream<List<City>> citiesStream();
  Stream<City> cityStream(String? cityId);
  Stream<ResourcePicture> resourcePictureStream(String? resourcePictureId);
  Stream<List<City>> citiesProvinceStream(String? provinceId);
  Stream<List<Interest>> interestStream();
  Stream<List<SpecificInterest>> specificInterestStream(String? interestId);
  Stream<List<UserEnreda>> checkIfUserEmailRegistered(String email);
  Stream<List<Nature>> natureStream();
  Stream<List<Scope>> scopeStream();
  Stream<List<SizeOrg>> sizeStream();
  Stream<List<Ability>> abilityStream();
  Stream<List<Dedication>> dedicationStream();
  Stream<List<TimeSearching>> timeSearchingStream();
  Stream<List<TimeSpentWeekly>> timeSpentWeeklyStream();
  Stream<List<Education>> educationStream();
  Stream<List<Gender>> genderStream();
  Stream<List<Test>> testsStream();
  Stream<List<TrainingPill>> trainingPillStream();
  Stream<List<TrainingPill>> filteredTrainingPillStream(FilterTrainingPill filter);
  Stream<TrainingPill> trainingPillStreamById(String id);

  Future<void> addContact(Contact contact);
  Future<void> addUnemployedUser(UnemployedUser unemployedUser);
  Future<void> addMentorUser(MentorUser mentorUser);
  Future<void> addOrganizationUser(OrganizationUser organizationUser);
  Future<void> addOrganization(Organization organization);

}

class FirestoreDatabase implements Database {
  FirestoreDatabase();
  final _service = FirestoreService.instance;

  @override
  Stream<List<Test>> testsStream() {
    Stream<List<Test>> tests = _service.collectionStream(
      path: APIPath.test(),
      queryBuilder: (query) => query
          .where('testId', isNotEqualTo: ''),
      builder: (data, documentId) => Test.fromMap(data, documentId),
      sort: (lhs, rhs) => lhs.testId.compareTo(rhs.testId),
    );
    return tests;
  }

  @override
  Stream<List<UserEnreda>> youngsStream() {
    Stream<List<UserEnreda>> youngs = _service.collectionStream(
      path: APIPath.users(),
      queryBuilder: (query) => query
          .where('role', isEqualTo: 'Desempleado')
          .where('active', isEqualTo: true),
      builder: (data, documentId) => UserEnreda.fromMap(data, documentId),
      sort: (lhs, rhs) => lhs.email.compareTo(rhs.email),
    );
    return youngs;
  }


  @override
  Stream<List<Resource>> resourcesStream() {
    return _service.collectionStream(
      path: APIPath.resources(),
      queryBuilder: (query) => query
          .where('trust', isEqualTo: true),
      builder: (data, documentId) => Resource.fromMap(data, documentId),
      sort: (lhs, rhs) => lhs.title.compareTo(rhs.title),
    );
  }

  @override
  Stream<List<ResourceCategory>> getCategoriesResources() {
    return _service.collectionStream(
      path: APIPath.resourcesCategories(),
      queryBuilder: (query) => query.where('name', isNotEqualTo: null),
      builder: (data, documentId) => ResourceCategory.fromMap(data, documentId),
      sort: (lhs, rhs) => lhs.order.compareTo(rhs.order),
    );
  }

  @override
  Stream<List<Resource>> filteredResourcesCategoryStream(FilterResource filter) {
    return _service.filteredCollectionStream(
      path: APIPath.resources(),
      queryBuilder: (query) {
        query = query.where('status', isEqualTo: 'Disponible').where('trust', isEqualTo: true);
        return query;
      },
      builder: (data, documentId) {
        final searchTextResource = removeDiacritics((data['searchText'] ?? '').toLowerCase());
        final searchListResource = searchTextResource.split(';');
        final searchTextFilter = removeDiacritics(filter.searchText.toLowerCase());
        final searchListFilter = searchTextFilter.split(' ');
        // The following code checks if a resource is selected by applying filters
        bool resourceSelected = true; // Initialize resourceSelected to true

        // If search text exists in filter, filter through the search list
        if (filter.searchText != '') {
          searchListFilter.forEach((filterElement) {
            // For each element in searchListFilter, check against each element in searchListResource
            if (!searchListResource.any(
                    (resourceElement) => resourceElement.contains(filterElement))) {
              resourceSelected = false; // Set resourceSelected false if a match isn't found
            }
          });
        }

        if (!filter.resourceCategoryId.contains(data['resourceCategory'])) {
          resourceSelected = false;
        }

        return resourceSelected ? Resource.fromMap(data, documentId) : null;
      },
      sort: (rhs, lhs) => lhs.createdate.compareTo(rhs.createdate),
    );
  }

  // @override
  // Stream<List<Resource>> filteredResourcesStream(FilterResource filter) {
  //   return _service.filteredCollectionStream(
  //     path: APIPath.resources(),
  //     queryBuilder: (query) {
  //       query = query
  //           .where('status', isEqualTo: 'Disponible')
  //           .where('trust', isEqualTo: true);
  //       return query;
  //     },
  //     builder: (data, documentId) {
  //       final searchTextResource = removeDiacritics((data['searchText']??'').toLowerCase());
  //       final searchListResource = searchTextResource.split(';');
  //       final searchTextFilter = removeDiacritics(filter.searchText.toLowerCase());
  //       final searchListFilter = searchTextFilter.split(' ');
  //       bool isValid = true;
  //       if (filter.searchText != '') {
  //         searchListFilter.forEach((filterElement) {
  //           if (!searchListResource.any((resourceElement) =>
  //               resourceElement.contains(filterElement))) {
  //             isValid = false;
  //           }
  //         });
  //       }
  //       if (filter.resourceTypes.isNotEmpty && !filter.resourceTypes.contains(getResourceTypeName(data['resourceType'])))
  //         isValid = false;
  //
  //       return isValid? Resource.fromMap(data, documentId):null;
  //     },
  //     sort: (lhs, rhs) {
  //
  //       int cmp = 0;
  //       if ((rhs.modality == StringConst.FACE_TO_FACE || rhs.modality == StringConst.BLENDED)
  //           && (lhs.modality != StringConst.FACE_TO_FACE && lhs.modality != StringConst.BLENDED)) cmp = 1;
  //       if ((lhs.modality == StringConst.FACE_TO_FACE || lhs.modality == StringConst.BLENDED) &&
  //           (rhs.modality != StringConst.FACE_TO_FACE && rhs.modality != StringConst.BLENDED)) cmp = -1;
  //
  //       if (cmp != 0) return cmp;
  //
  //       return lhs.maximumDate.compareTo(rhs.maximumDate);
  //
  //     },
  //   );
  // }


  Stream<Resource> resourceStream(String resourceId) =>
      _service.documentStream<Resource>(
        path: APIPath.resource(resourceId),
        builder: (data, documentId) => Resource.fromMap(data, documentId),
      );

  @override
  Stream<List<Organization>> organizationsStream() => _service.collectionStream(
    path: APIPath.organizations(),
    queryBuilder: (query) => query
        .where('trust', isEqualTo: true),
    builder: (data, documentId) => Organization.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
  );

  Stream<Organization> organizationStream(String organizationId) {
    final organization =  _service.documentStream<Organization>(
      path: APIPath.organization(organizationId),
      builder: (data, documentId) => Organization.fromMap(data, documentId),
    );
    return organization;
  }


  Stream<UserEnreda> mentorStream(String mentorId) =>
      _service.documentStream<UserEnreda>(
        path: APIPath.user(mentorId),
        builder: (data, documentId) => UserEnreda.fromMap(data, documentId),
      );

  @override
  Stream<List<Country>> countriesStream() => _service.collectionStream(
    path: APIPath.countries(),
    queryBuilder: (query) => query
        .where('coutryId', isNotEqualTo: null),
    builder: (data, documentId) => Country.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
  );

  Stream<Country> countryStream(String? countryId) =>
      _service.documentStream<Country>(
        path: APIPath.country(countryId),
        builder: (data, documentId) => Country.fromMap(data, documentId),
      );

  @override
  Stream<List<Province>> provincesStream() => _service.collectionStream(
    path: APIPath.provinces(),
    queryBuilder: (query) => query
        .where('provinceId', isNotEqualTo: null),
    builder: (data, documentId) => Province.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
  );

  Stream<Province> provinceStream(String? provinceId) =>
      _service.documentStream<Province>(
        path: APIPath.province(provinceId),
        builder: (data, documentId) => Province.fromMap(data, documentId),
      );

  @override
  Stream<List<City>> citiesStream() => _service.collectionStream(
    path: APIPath.cities(),
    queryBuilder: (query) => query
        .where('cityId', isNotEqualTo: null),
    builder: (data, documentId) => City.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
  );

  Stream<City> cityStream(String? cityId) => _service.documentStream<City>(
    path: APIPath.city(cityId),
    builder: (data, documentId) => City.fromMap(data, documentId),
  );

  Stream<ResourcePicture> resourcePictureStream(String? resourcePictureId) =>
      _service.documentStream<ResourcePicture>(
        path: APIPath.resourcePicture(resourcePictureId),
        builder: (data, documentId) => ResourcePicture.fromMap(data, documentId),
      );

  @override
  Stream<List<Country>> countryFormatedStream() => _service.collectionStream(
    path: APIPath.countries(),
    queryBuilder: (query) => query.where('name', isNotEqualTo: 'Online'),
    builder: (data, documentId) => Country.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
  );

  @override
  Stream<List<Province>> provincesCountryStream(String? countryId) {

    if (countryId == null)
      return Stream<List<Province>>.empty();

    return _service.collectionStream(
      path: APIPath.provinces(),
      builder: (data, documentId) => Province.fromMap(data, documentId),
      queryBuilder: (query) => query.where('countryId', isEqualTo: countryId),
      sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
    );
  }

  @override
  Stream<List<City>> citiesProvinceStream(String? provinceId) =>
      _service.collectionStream(
        path: APIPath.cities(),
        builder: (data, documentId) => City.fromMap(data, documentId),
        queryBuilder: (query) =>
            query.where('provinceId', isEqualTo: provinceId),
        sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
      );

  @override
  Stream<List<Interest>> interestStream() => _service.collectionStream(
    path: APIPath.interests(),
    queryBuilder: (query) => query.where('name', isNotEqualTo: null),
    builder: (data, documentId) => Interest.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
  );

  @override
  Stream<List<SpecificInterest>> specificInterestStream(String? interestId) =>
      _service.collectionStream(
        path: APIPath.specificInterests(),
        queryBuilder: (query) => query.where('interestId', isEqualTo: interestId),
        builder: (data, documentId) => SpecificInterest.fromMap(data, documentId),
        sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
      );

  @override
  Stream<List<Ability>> abilityStream() => _service.collectionStream(
    path: APIPath.abilities(),
    queryBuilder: (query) => query.where('name', isNotEqualTo: null),
    builder: (data, documentId) => Ability.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
  );

  @override
  Stream<List<Nature>> natureStream() => _service.collectionStream(
    path: APIPath.natures(),
    queryBuilder: (query) => query.where('label', isNotEqualTo: null),
    builder: (data, documentId) => Nature.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.label.compareTo(rhs.label),
  );

  @override
  Stream<List<Scope>> scopeStream() => _service.collectionStream(
    path: APIPath.scopes(),
    queryBuilder: (query) => query.where('label', isNotEqualTo: null),
    builder: (data, documentId) => Scope.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.order.compareTo(rhs.order),
  );

  @override
  Stream<List<SizeOrg>> sizeStream() => _service.collectionStream(
    path: APIPath.sizes(),
    queryBuilder: (query) => query.where('label', isNotEqualTo: null),
    builder: (data, documentId) => SizeOrg.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.order.compareTo(rhs.order),
  );

  @override
  Stream<List<Dedication>> dedicationStream() => _service.collectionStream(
    path: APIPath.dedications(),
    queryBuilder: (query) => query.where('label', isNotEqualTo: null),
    builder: (data, documentId) => Dedication.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.value.compareTo(rhs.value),
  );

  @override
  Stream<List<TimeSearching>> timeSearchingStream() => _service.collectionStream(
    path: APIPath.timeSearching(),
    queryBuilder: (query) => query.where('label', isNotEqualTo: null),
    builder: (data, documentId) => TimeSearching.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.value.compareTo(rhs.value),
  );

  @override
  Stream<List<TimeSpentWeekly>> timeSpentWeeklyStream() => _service.collectionStream(
    path: APIPath.timeSpentWeekly(),
    queryBuilder: (query) => query.where('label', isNotEqualTo: null),
    builder: (data, documentId) => TimeSpentWeekly.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.value.compareTo(rhs.value),
  );

  @override
  Stream<List<Education>> educationStream() => _service.collectionStream(
    path: APIPath.education(),
    queryBuilder: (query) => query.where('label', isNotEqualTo: null),
    builder: (data, documentId) => Education.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.order.compareTo(rhs.order),
  );

  @override
  Stream<List<Gender>> genderStream() => _service.collectionStream(
    path: APIPath.genders(),
    queryBuilder: (query) => query.where('name', isNotEqualTo: null),
    builder: (data, documentId) => Gender.fromMap(data, documentId),
    sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
  );

  @override
  Stream<List<TrainingPill>> trainingPillStream() {
    return _service.collectionStream(
      path: APIPath.trainingPills(),
      queryBuilder: (query) => query.where('status', isEqualTo: 'Disponible'),
      builder: (data, documentId) => TrainingPill.fromMap(data, documentId),
      sort: (lhs, rhs) => lhs.order.compareTo(rhs.order),
    );
  }

  @override
  Stream<List<TrainingPill>> filteredTrainingPillStream(FilterTrainingPill filter) {
    return _service.filteredCollectionStream(
      path: APIPath.trainingPills(),
      queryBuilder: (query) {
        query = query.where('id', isNotEqualTo: null);
        return query;
      },
      builder: (data, documentId) {
        final searchTextChallenge = removeDiacritics((data['searchText'] ?? '').toLowerCase());
        final searchListSolution = searchTextChallenge.split(';');
        final searchTextFilter = removeDiacritics(filter.searchText.toLowerCase());
        final searchListFilter = searchTextFilter.split(' ');

        if (filter.searchText == '')
          return TrainingPill.fromMap(data, documentId);

        // The following code checks if an idea is selected by applying filters
        bool textFilterSelection = false; // Initialize textFilter result to false

        // If search text exists in filter, filter through the search list
        if (filter.searchText != '') {
          searchListFilter.forEach((filterElement) {
            // For each element in searchListFilter, check against each element in searchListIdea
            if (searchListSolution.any(
                    (resourceElement) => resourceElement.contains(filterElement))) {
              textFilterSelection = textFilterSelection || true; // Set ideaSelected false if a match isn't found
            }
          });
        }
        return textFilterSelection ? TrainingPill.fromMap(data, documentId) : null;
      },
      sort: (lhs, rhs) => lhs.order.compareTo(rhs.order),
    );
  }

  @override
  Stream<TrainingPill> trainingPillStreamById(String id) =>
      _service.documentStream<TrainingPill>(
        path: APIPath.trainingPill(id),
        builder: (data, documentId) => TrainingPill.fromMap(data, documentId),
      );


  @override
  Future<void> addContact(Contact contact) =>
      _service.addData(path: APIPath.contacts(), data: contact.toMap());

  @override
  Future<void> addUnemployedUser(UnemployedUser unemployedUser) =>
      _service.addData(path: APIPath.users(), data: unemployedUser.toMap());

  @override
  Future<void> addMentorUser(MentorUser mentorUser) =>
      _service.addData(path: APIPath.users(), data: mentorUser.toMap());

  @override
  Future<void> addOrganization(Organization organization) =>
      _service.addData(path: APIPath.organizations(), data: organization.toMap());

  @override
  Future<void> addOrganizationUser(OrganizationUser organizationUser) =>
      _service.addData(path: APIPath.users(), data: organizationUser.toMap());

  @override
  Stream<List<UserEnreda>> checkIfUserEmailRegistered(String email) {
    return _service.collectionStream(
      path: APIPath.users(),
      builder: (data, documentId) => UserEnreda.fromMap(data, documentId),
      queryBuilder: (query) => query
          .where('email', isEqualTo: email),
      sort: (lhs, rhs) => lhs.email.compareTo(rhs.email),
    );
  }
}