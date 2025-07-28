import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';

import '../../../core/api/network/common/result.dart';

abstract class EventRepository {
  Future<Result<List<EventEntity>>> getAllEvents();
  Future<Result<String>> deleteEvent({required int id});

  Future<Result<String>> createEvent({
    required List<MultipartFile> files,
    required String title,
    required String description,
    required String startTime,
  });
}
