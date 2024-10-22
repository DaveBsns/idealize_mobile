import 'package:idealize_new_version/Core/Data/Models/notification_model.dart';
import 'package:idealize_new_version/Core/Data/Services/notification_service.dart';

import '../../domain/notification_repo.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<List<Notification>> fetchAll() async {
    return await NotificationService().fetchAllNotifications();
  }

  @override
  Future<bool> clear() async {
    return await NotificationService().clearNotifications();
  }

  @override
  Future<bool> read(List<String> notificationsId) async {
    return await NotificationService().readNotifications(notificationsId);
  }
}
