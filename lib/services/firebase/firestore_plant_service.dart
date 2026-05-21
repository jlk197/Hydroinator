import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroinator/config/app_config.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/services/firebase/auth_service.dart';

class FirestorePlantService {
  final AuthService authService;
  FirestorePlantService({required this.authService});
  final firestore = FirebaseFirestore.instance;

  Future<void> addPlant(Plant plant) async {
    await firestore.collection(AppConfig.plantsCollection).add({
      ...plant.toJson(),
      'ownerId': authService.currentUserId,
    });
  }

  Future<void> updatePlant(Plant plant) async {
    final documentId = plant.documentId;
    if (documentId == null) {
      throw StateError('Cannot update a plant without a Firestore documentId');
    }
    await firestore
        .collection(AppConfig.plantsCollection)
        .doc(documentId)
        .update(plant.toJson());
  }

  Future<List<Plant>> getAlivePlants() async {
    final snapshot = await firestore
        .collection(AppConfig.plantsCollection)
        .where('isAlive', isEqualTo: true)
        .where('ownerId', isEqualTo: authService.currentUserId)
        .get();
    return snapshot.docs
        .map((doc) => Plant.fromJson(doc.data())..documentId = doc.id)
        .toList();
  }

  Future<List<Plant>> getDeadPlants() async {
    final snapshot = await firestore
        .collection(AppConfig.plantsCollection)
        .where('isAlive', isEqualTo: false)
        .where('ownerId', isEqualTo: authService.currentUserId)
        .get();
    return snapshot.docs
        .map((doc) => Plant.fromJson(doc.data())..documentId = doc.id)
        .toList();
  }

  Future<List<Plant>> getAllPlants() async {
    final snapshot = await firestore
        .collection(AppConfig.plantsCollection)
        .where('ownerId', isEqualTo: authService.currentUserId)
        .get();
    return snapshot.docs
        .map((doc) => Plant.fromJson(doc.data())..documentId = doc.id)
        .toList();
  }
}
