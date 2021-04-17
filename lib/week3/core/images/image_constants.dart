class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance {
    if (_instace != null) return _instace!;
    _instace = ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

  final bracoli = 'broccoli'.toPng;
  final kale = 'kale'.toPng;
  final pepper = 'pepper'.toPng;
  final strawBerry = 'strawberry'.toPng;
}

extension _ImageExtension on String {
  // Add to png path on image string
  String get toPng => 'assets/image/$this.png';
}
