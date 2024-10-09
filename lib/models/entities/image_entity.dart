import 'package:isar/isar.dart';

part 'image_entity.g.dart';

@embedded
class ImageEntity {
  DateTime? dateTime;
  String image;
  ImageEntity({this.image = "", this.dateTime});
}
