import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';

abstract class EventRemoteDataSource {
  Future<List<EventEntity>>getAllEvents();
}