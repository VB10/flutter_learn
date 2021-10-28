import 'package:dio/dio.dart';

import '../model/photos_model.dart';

abstract class IPhotosService {
  final Dio dio;

  IPhotosService(this.dio);

  Future<List<PhotoModel>> fetchAllPhotos();
}
