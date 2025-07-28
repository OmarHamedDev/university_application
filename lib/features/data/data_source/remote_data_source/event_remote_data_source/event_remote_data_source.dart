import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';

abstract class EventRemoteDataSource {
  Future<List<EventEntity>>getAllEvents();
  Future<String>deleteEvent(int id);
  Future<String>createEvent({
    required List<MultipartFile> files,
    required String title,
    required String description,
    required String startTime,
  });
}