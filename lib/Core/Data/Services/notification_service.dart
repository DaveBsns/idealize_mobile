import 'package:idealize_new_version/Core/Data/Models/notification_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/app_repo.dart';
import './services_helper.dart';

class NotificationService extends ServicesHelper {
  Future<List<Notification>> fetchAllNotifications() async {
    final mappedData = await request(
      '$baseURL/notifications/all',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return mappedData != null
        ? [
            for (final mappedNotification in mappedData)
              Notification.fromJson(mappedNotification)
          ]
        : [];
  }

  Future<bool> readNotifications(List<String> notificationsId) async {
    final mappedData = await request(
      '$baseURL/notifications/read',
      serviceType: ServiceType.post,
      body: {
        'userId': AppRepo().user!.id,
        'notificationsId': notificationsId,
      },
      requiredDefaultHeader: true,
    );

    return mappedData != null && mappedData;
  }

  Future<bool> clearNotifications() async {
    final mappedData = await request(
      '$baseURL/notifications/clear',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    return mappedData != null && mappedData;
  }

  Future<int> getCountOfUnreadNotifications() async {
    final mappedData = await request(
      '$baseURL/notifications/unread-count',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    if (mappedData != null && mappedData['unreadNotifications'] != null) {
      return mappedData['unreadNotifications'] as int;
    } else {
      return 0;
    }
  }
}
