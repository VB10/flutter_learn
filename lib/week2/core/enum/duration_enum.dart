import '../exception/duration_exception.dart';

enum DurationEnums { LOW, HIGH, NORMAL }

extension DurationEnumsExtension on DurationEnums {
  /// Your duration enums covert to [Duration] item.
  Duration get time {
    switch (this) {
      case DurationEnums.HIGH:
        return Duration(seconds: 10);

      case DurationEnums.NORMAL:
        return Duration(seconds: 5);

      case DurationEnums.LOW:
        return Duration(seconds: 2);

      default:
        throw DurationException(this);
    }
  }
}
