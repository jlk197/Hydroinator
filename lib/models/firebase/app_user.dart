import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String id;
  final String name;
  final DateTime createdAt;

  AppUser({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory AppUser.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return AppUser(
      id: doc.id,
      name: data['name'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}