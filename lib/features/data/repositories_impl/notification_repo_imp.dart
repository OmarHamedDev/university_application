import 'package:dio/src/response.dart';
import 'package:hti_university_app_1/core/api/addition/serviceApi.dart';
import 'package:hti_university_app_1/features/domain/repositories/notification_repository.dart';

class NotificationRepoImp implements Notification{
  final ServiceAPIs serviceAPIs;

  NotificationRepoImp(this.serviceAPIs);

  @override
  Future<Response> notification() async {
final response =await serviceAPIs.notification();
return response;
  }

}