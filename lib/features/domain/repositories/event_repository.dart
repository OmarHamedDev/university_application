import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';

import '../../../core/api/network/common/result.dart';

abstract class EventRepository {
  Future<Result<List<EventEntity>>>getAllEvents();
}