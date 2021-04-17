import 'dart:io';

import 'package:dio/src/dio.dart';

import '../model/photos_model.dart';
import 'IPhotosService.dart';

part './photo_service_path.dart';

class PhotoService extends IPhotosService {
  PhotoService(Dio dio) : super(dio);

  @override
  Future<List<PhotoModel>> fetchAllPhotos() async {
    final response = await dio.get(_PhotoServicePath.PHOTOS.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => PhotoModel.fromJson(e)).toList();
      }
    }

    return [];
  }
}
