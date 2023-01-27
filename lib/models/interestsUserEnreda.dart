import 'package:flutter/material.dart';

class InterestsUserEnreda {
  InterestsUserEnreda({required this.interests, this.specificInterests,
  });

  factory InterestsUserEnreda.fromMap(Map<String, dynamic> data, String documentId) {
    final List<String> interests = data['interests'];
    final List<String> specificInterests = data['specificInterests'];

    return InterestsUserEnreda(
      interests: interests,
      specificInterests: specificInterests,
    );
  }

  final List<String> interests;
  final List<String>? specificInterests;

  Map<String, dynamic> toMap() {
    return {
      'interests': interests,
      'specificInterests': specificInterests,
    };
  }
}