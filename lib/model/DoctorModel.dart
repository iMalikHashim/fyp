import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String name;
  final String? experience;
  final String location;
  final String specialty;
  final String? profilePictureUrl;

  Doctor({
    required this.name,
    this.experience,
    required this.location,
    required this.specialty,
    this.profilePictureUrl,
  });

  // Factory constructor moved inside the Doctor class
  factory Doctor.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Doctor(
      name: doc.get('name'),
      profilePictureUrl: doc.get('profilePictureUrl'),
      location: doc.get('location'),
      specialty: doc.get('specialty'),
      experience: doc.get('experience'),
    );
  }
}
