class EnvNotFound implements Exception {
  final String? value;

  EnvNotFound(this.value);

  @override
  String toString() {
    return 'This $value doesnt found in env file';
  }
}
