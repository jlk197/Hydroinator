
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FirebaseStorageService {
  Future<String> uploadImage(File file) async {
  final uri = Uri.parse(
    'https://api.cloudinary.com/v1_1/dblnarvbh/image/upload',
  );

  final request = http.MultipartRequest('POST', uri);

  request.fields['upload_preset'] = 'ml_default';

  request.files.add(
    await http.MultipartFile.fromPath(
      'file',
      file.path,
    ),
  );

  final response = await request.send();

  final data = jsonDecode(
    await response.stream.bytesToString(),
  );

  return data['secure_url'];
}
}