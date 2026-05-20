import 'package:cloud_firestore/cloud_firestore.dart';

class FirestorePlantService {
  final firestore = FirebaseFirestore.instance;

  Future<void> addPlant() async {
    /*await firestore.collection(AppConfig.plantsCollection).add({
      'title': 'Hello',
      'createdAt': Timestamp.now(),
    });*/
  }

  Future<void> updatePlant() async {}
  Future<void> deadPlant() async {}
  Future<void> getAlivePlants() async {}
  Future<void> getDeadPlants() async {}

  
}