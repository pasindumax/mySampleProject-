enum OnlineStatus { online, busy, offline }

extension OnlineStatusExtension on OnlineStatus {
  int get id {
    switch (this) {
      case OnlineStatus.online:
        return 1;
      case OnlineStatus.busy:
        return 2;
      case OnlineStatus.offline:
        return 3;
    }
  }

  OnlineStatus onlineStatusById(int? id) {
    switch (id) {
      case 1:
        return OnlineStatus.online;
      case 2:
        return OnlineStatus.busy;
      case 3:
        return OnlineStatus.offline;
      default:
        return OnlineStatus.online;
    }
  }
}
