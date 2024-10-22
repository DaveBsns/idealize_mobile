import 'package:idealize_new_version/Core/Data/Models/notification_model.dart';

abstract class NotificationRepository {
  Future<List<Notification>> fetchAll();
  Future<bool> read(List<String> notificationsId);
  Future<bool> clear();
}
