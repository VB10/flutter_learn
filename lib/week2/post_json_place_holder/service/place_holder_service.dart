import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/enum/service_path_enum.dart';
import '../model/post_model.dart';

class PlaceHolderService {
  Future<List<PostModel>?> fetchPostItems() async {
    final url = Uri.parse('${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.POST.rawValue}');
    final response = await http.get(url);
    // TODO: Hello
    switch (response.statusCode) {
      case HttpStatus.ok:
        final reponseBody = jsonDecode(response.body);
        if (reponseBody is List) {
          return reponseBody.map((e) => PostModel.fromJson(e)).toList();
        }
        return [];
      default:
        return null;
      // throw Exception('Service error $response');
    }
  }
}
