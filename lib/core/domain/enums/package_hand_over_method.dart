enum PackageHandOverMethod { leaveAtTheDoor, meetAtTheDoor }

extension PackageHandOverMethodExtension on PackageHandOverMethod {
  int get id {
    switch (this) {
      case PackageHandOverMethod.leaveAtTheDoor:
        return 1;
      case PackageHandOverMethod.meetAtTheDoor:
        return 2;
    }
  }

  String get packageHandOverMethodName {
    switch (this) {
      case PackageHandOverMethod.leaveAtTheDoor:
        return 'Leave At TheDoor';
      case PackageHandOverMethod.meetAtTheDoor:
        return 'Meet At TheDoor';
    }
  }

  PackageHandOverMethod statusEnum(int value) {
    switch (value) {
      case 1:
        return PackageHandOverMethod.leaveAtTheDoor;
      case 2:
        return PackageHandOverMethod.meetAtTheDoor;
      default:
        return PackageHandOverMethod.leaveAtTheDoor;
    }
  }
}
