
class APIPath {
  static String resource(String resourceId) => 'resources/$resourceId';
  static String resources() => 'resources';
  static String resourcesCategories() => 'resourcesCategories';
  static String organization(String organizationId) => 'organizations/$organizationId';
  static String organizations() => 'organizations';
  static String socialEntity(String socialEntityId) => 'socialEntities/$socialEntityId';
  static String country(String? countryId) => 'countries/$countryId';
  static String countries() => 'countries';
  static String province(String? provinceId) => 'provinces/$provinceId';
  static String provinces() => 'provinces';
  static String city(String? cityId) => 'cities/$cityId';
  static String cities() => 'cities';
  static String resourcePicture(String? resourcePictureId) => 'resourcesPictures/$resourcePictureId';
  static String users() => 'users';
  static String natures() => 'natures';
  static String scopes() => 'scopes';
  static String sizes() => 'sizes';
  static String abilities() => 'abilities';
  static String dedications() => 'dedications';
  static String timeSearching() => 'timeSearchings';
  static String timeSpentWeekly() => 'timeSpentWeeklys';
  static String education() => 'educations';
  static String genders() => 'genders';
  static String user(String? userId) => 'users/$userId';
  static String interests() => 'interests';
  static String specificInterests() => 'specificInterests';
  static String photoUser(String userId) => 'users/$userId';
  static String contacts() => 'contact';
  static String certificates() => 'certificates';
  static String certificate(String certificateId) => 'certificates/$certificateId';
  static String test() => 'test';
  static String trainingPills() => 'trainingPills';
  static String trainingPill(String? trainingPillId) => 'trainingPills/$trainingPillId';
}