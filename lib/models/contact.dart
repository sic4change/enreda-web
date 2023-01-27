
class Contact {
  Contact({this.contactId, required this.email, required this.name, required this.text});

  final String? contactId;
  final String email;
  final String name;
  final String text;

  factory Contact.fromMap(Map<String, dynamic> data, String documentId) {

    return Contact(
      contactId: data['contactId'],
      email: data['email'],
      name: data['name'],
      text: data['text'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contactId': contactId,
      'email' : email,
      'name' : name,
      'text' : text,
    };
  }
}