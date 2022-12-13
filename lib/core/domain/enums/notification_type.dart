enum NotificationType {
  common,
  geoFence,
  incomingTrip,
}

extension FirestoreRequestTypeExtension on NotificationType {
  int get id {
    switch (this) {
      case NotificationType.common:
        return 1;

      case NotificationType.geoFence:
        return 2;

      case NotificationType.incomingTrip:
        return 3;
    }
  }

  String get notificationTypeName {
    switch (this) {
      case NotificationType.geoFence:
        return 'geoFence';
      case NotificationType.incomingTrip:
        return 'incomingTrip';

      case NotificationType.common:
        return 'common';
    }
  }

  NotificationType statusEnum(int value) {
    switch (value) {
      case 1:
        return NotificationType.common;
      case 2:
        return NotificationType.geoFence;
      case 3:
        return NotificationType.incomingTrip;

      default:
        return NotificationType.common;
    }
  }
}
