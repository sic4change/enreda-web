
class Resource {
  Resource({
    required this.title,
    required this.description,
    required this.resourceId,
    required this.organizer,
    this.organizerType,
    this.organizerName,
    this.organizerImage,
    this.promotor,
    this.resourceType,
    this.resourceTypeName,
    required this.capacity,
    required this.duration,
    required this.modality,
    required this.place,
    this.street,
    this.country,
    this.countryName,
    this.province,
    this.provinceName,
    this.city,
    this.cityName,
    required this.maximumDate,
    required this.start,
    required this.end,
    this.temporality,
    this.link,
    required this.status,
    required this.participants,
    this.assistants,
    required this.likes,
    this.contractType,
    this.salary,
    this.contactEmail,
    this.contactPhone,
    this.resourcePictureId,
    this.resourcePhoto,
    this.searchText,
  });

  factory Resource.fromMap(Map<String, dynamic> data, String documentId) {

    final String title = data['title'];
    final String description = data['description'];
    final String organizer = data['organizer'];
    final String? organizerType = data['organizerType'];
    final String? organizerName = data['organizerName'];
    final String? organizerImage = data['organizerImage'];
    final String? promotor = data['promotor'];
    final String? resourceType = data['resourceType'];
    final String? contractType = data['contractType'];
    final String? salary = data['salary'];
    final String? resourceTypeName = data['resourceTypeName'];
    final int capacity = data['capacity'];
    final String duration = data['duration'];
    final String modality = data['modality'];
    final String? country = data['address']['country'];
    final String? countryName = data['countryName'];
    final String? province = data['address']['province'];
    final String? provinceName = data['provinceName'];
    final String? city = data['address']['city'];
    final String? cityName = data['cityName'];
    final String place = data['address']['place'];
    final String? street = data['address']['street'];
    final DateTime maximumDate = data['maximumDate'].toDate();
    final DateTime start = DateTime.parse(data['start'].toDate().toString());
    final DateTime end =  DateTime.parse(data['end'].toDate().toString());
    final String? temporality = data['temporality'];
    final String? link = data['link'];
    final String status = data['status'];
    final String? resourcePictureId = data['resourcePictureId'];
    List<String> participants = [];
    if (data['participants'] != null) {
      data['participants'].forEach((participant) {participants.add(participant.toString());});
    }
    final String assistants = data['assistants'].toString();
    List<String> likes = [];
    if (data['likes'] != null) {
      data['likes'].forEach((like) {likes.add(like.toString());});
    }
    final String? contactEmail = data['contactEmail'];
    final String? contactPhone = data['contactPhone'];
    final String? resourcePhoto = data['resourcePhoto'];
    final String? searchText = data['searchText'];

    return Resource(
      resourceId: documentId,
      title: title,
      description: description,
      organizer: organizer,
      organizerType : organizerType,
      organizerName: organizerName,
      organizerImage: organizerImage,
      promotor: promotor,
      resourceType: resourceType,
      resourceTypeName:  resourceTypeName,
      capacity: capacity,
      duration: duration,
      modality: modality,
      country: country,
      countryName: countryName,
      province: province,
      provinceName: provinceName,
      city: city,
      cityName: cityName,
      place: place,
      street: street,
      maximumDate: maximumDate,
      start: start,
      end: end,
      temporality: temporality,
      link: link,
      status: status,
      participants: participants,
      assistants: assistants,
      likes: likes,
      salary: salary,
      contractType: contractType,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      resourcePictureId: resourcePictureId,
      resourcePhoto: resourcePhoto,
      searchText: searchText,
    );
  }

  final String resourceId;
  final String title;
  final String organizer;
  String? organizerType;
  String? organizerName;
  String? organizerImage;
  final String? promotor;
  final String description;
  String? resourceType;
  String? resourceTypeName;
  final int capacity;
  final String duration;
  final String modality;
  final String? country;
  String? countryName;
  final String? province;
  String? provinceName;
  final String? city;
  String? cityName;
  final String place;
  final String? street;
  final DateTime maximumDate;
  final DateTime start;
  final DateTime end;
  final String? temporality;
  final String? link;
  final String status;
  final List<String> participants;
  String? assistants;
  final List<String> likes;
  final String? contractType;
  final String? salary;
  final String? contactEmail;
  final String? contactPhone;
  String? resourcePictureId;
  String? resourcePhoto;
  final String? searchText;

  Map<String, dynamic> toMap() {
    return {
      'resourceId': resourceId,
      'title': title,
      'description': description,
      'organizer': organizer,
      'organizerType': organizerType,
      'organizerName': organizerName,
      'organizerImage': organizerImage,
      'promotor': promotor,
      'resourceType': resourceType,
      'capacity' : capacity,
      'duration' : duration,
      'modality' : modality,
      'country' : country,
      'countryName' : countryName,
      'province' : province,
      'provinceName' : provinceName,
      'city' : city,
      'cityName' : cityName,
      'place' : place,
      'street' : street,
      'maximumDate' : maximumDate,
      'start' : start,
      'end' : end,
      'temporality' : temporality,
      'link' : link,
      'status' : status,
      'participants' : participants,
      'assistants' : assistants,
      'likes' : likes,
      'contractType' : contractType,
      'salary' : salary,
      'contactEmail' : contactEmail,
      'contactPhone' : contactPhone,
      'resourcePictureId': resourcePictureId,
      'resourcePhoto': resourcePhoto,
      'searchText': searchText,
    };
  }

  void setResourceTypeName() {
    switch(this.resourceType) {
      case '4l9BLhP7cwXohUvQzMOT': {
        this.resourceTypeName = 'Programa de aceleración de emprendimiento';
      }
      break;

      case 'E19QFsYBxlcw3edEF2Qp': {
        this.resourceTypeName = 'Otros';
      }
      break;

      case 'EsV5yvTXtyIrVobpefB6': {
        this.resourceTypeName = 'Eventos profesionales';
      }
      break;

      case 'GOw01m2HPro4I8xd6rSj': {
        this.resourceTypeName = 'Desarrollo de habilidades sociales';
      }
      break;

      case 'LRWhKw4kpmTZtShUFiTV': {
        this.resourceTypeName = 'Prácticas';
      }
      break;

      case 'MvCHSFzASskxlkBzPElb': {
        this.resourceTypeName = 'Apoyo y orientación para el empleo';
      }
      break;

      case 'N9KdlBYmxUp82gOv8oJC': {
        this.resourceTypeName = 'Formación';
      }
      break;

      case 'PPX3Ufeg9YfzH4YA0SkU': {
        this.resourceTypeName = 'Financiación / Soporte / Ayuda económica';
      }
      break;

      case 'QBTbYYx9EUwNtKB68Xfz': {
        this.resourceTypeName = 'Bolsa de empleo';
      }
      break;

      case 'VGuwRNVjRY2bzVcVhnnN': {
        this.resourceTypeName = 'Voluntariado';
      }
      break;

      case 'iGkqdz7uiWuXAFz1O8PY': {
        this.resourceTypeName = 'Hobbies, ocio y tiempo libre';
      }
      break;

      case 'kUM5r4lSikIPLMZlQ7FD': {
        this.resourceTypeName = 'Oferta de empleo';
      }
      break;

      case 'lUubulxiAGo4llxFJrkl': {
        this.resourceTypeName = 'Mentoría';
      }
      break;

      case 'r8ynPX9Y4P3WLtec2z21': {
        this.resourceTypeName = 'Beca';
      }
      break;

      default: {
        this.resourceTypeName = 'Otros';
      }
      break;
    }
  }

}
