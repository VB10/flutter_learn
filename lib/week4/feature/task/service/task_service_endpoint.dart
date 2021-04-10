part of 'task_service.dart';

enum _TaskServiceEndPoints { DOGS }

extension TaskServiceEndPintsExtension on _TaskServiceEndPoints {
  String get rawValue {
    switch (this) {
      case _TaskServiceEndPoints.DOGS:
        return '/dogs';
    }
  }
}
