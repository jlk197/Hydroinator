
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final storage = FirebaseStorage.instance;

  Future<String?> uploadImage(String filePath) async {
    final file = File(filePath);
    final ref = storage.ref().child(
      'plants/${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    await ref.putFile(file);
    final url = await ref.getDownloadURL();
    return url;
  }
}