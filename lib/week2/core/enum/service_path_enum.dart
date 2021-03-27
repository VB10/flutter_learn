enum ServicePathEnum { BASE_URL, POST }

extension ServicePathEnumExtension on ServicePathEnum {
  String get rawValue {
    switch (this) {
      case ServicePathEnum.BASE_URL:
        return 'https://jsonplaceholder.typicode.com';

      case ServicePathEnum.POST:
        return '/posts';

      default:
        throw Exception('Not found path');
    }
  }
}
