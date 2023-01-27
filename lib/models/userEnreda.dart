import 'package:enreda_app/models/profilepic.dart';
import 'package:flutter/material.dart';

import 'addressUser.dart';
import 'interestsUserEnreda.dart';

class UserEnreda {
  UserEnreda({
    required this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.userId,
    this.profilePic,
    this.photo,
    this.phone,
    this.birthday,
    this.country,
    this.province,
    this.city,
    this.postalCode,
    this.address,
    this.specificInterests: const [],
    this.interests: const [],
    this.abilities,
    this.unemployedType,
    this.role,
  });

  factory UserEnreda.fromMap(Map<String, dynamic> data, String documentId) {
    final String email = data['email'];
    final String? firstName = data['firstName'];
    final String? lastName = data['lastName'];
    final String? gender = data['gender'];
    final String? userId = data['userId'];
    final String? unemployedType = data['unemployedType'];
    final String? role = data['role'];
    String photo;
    try {
      photo = data['profilePic']['src'];
    } catch (e) {
      photo = '';
    }
    final String? phone = data['phone'];
    final DateTime? birthday =
        DateTime.parse(data['birthday'].toDate().toString());
    final String? country = data['address']['country'];
    final String? province = data['address']['province'];
    final String? city = data['address']['city'];
    final String? postalCode = data['address']['postalCode'];
    List<String> abilities = [];
    try {
      data['motivation']?['abilities']??[].forEach((ability) {abilities.add(ability.toString());});
    } catch(e) {
      print('user not abilities');
    }

    List<String> interests = [];
    try {
      data['interests']?['interests']??[].forEach((interest) {interests.add(interest.toString());});
    } catch(e){
      print('user not intersts');
    }

    List<String> specificInterests = [];
    try {
      data['interests']?['specificInterests']??[].forEach((specificInterest) {specificInterests.add(specificInterest.toString());});
    } catch(e){
      print('user not specific intersts');
    }

    final ProfilePic profilePic = new ProfilePic(
        src: photo, title: 'photo.jpg'
    );
    final Address address = new Address(
        country: country,
        province: province,
        city: city,
        postalCode: postalCode);

    return UserEnreda(
        email: email,
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        userId: userId,
        photo: photo,
        profilePic: profilePic,
        phone: phone,
        birthday: birthday,
        country: country,
        province: province,
        city: city,
        address: address,
        postalCode: postalCode,
        specificInterests: specificInterests,
        interests: interests,
        unemployedType: unemployedType,
      role: role,
      abilities: abilities,
    );
  }

  final String email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? userId;
  String? photo;
  final ProfilePic? profilePic;
  final String? phone;
  final DateTime? birthday;
  final String? country;
  final String? province;
  final String? city;
  final String? postalCode;
  final Address? address;
  final List<String> interests;
  final List<String> specificInterests;
  final String? unemployedType;
  final List<String>? abilities;
  final String? role;

  Map<String, dynamic> toMap() {
    InterestsUserEnreda interestUserEnreda = InterestsUserEnreda(interests: interests, specificInterests: specificInterests);
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'userId': userId,
      //'profilePic': profilePic.toMap(),
      'phone': phone,
      'birthday': birthday,
      'address': address?.toMap(),
      'interests' : interestUserEnreda.toMap(),
      'unemployedType' : unemployedType,
      'abilities' : abilities,
      'role' : role,
    };
  }
}
