import 'package:todo_app/features/todo/data/device/notification_service.dart';

class SendNotificationUseCase {
  final NotificationService _notificationService;

  const SendNotificationUseCase(this._notificationService);

  void call(
    final int projectId,
    final String todoTitle,
    final DateTime dueDate,
  ) {
    _notificationService.showSchedueledNotification(
      scheduledDate: dueDate,
      title: 'Protaly',
      body: todoTitle,
      payload: projectId.toString(),
    );
  }
}
