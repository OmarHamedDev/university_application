import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../repositories/event_repository.dart';
@injectable
class CreateEventUseCase {
  final EventRepository eventRepository;
  CreateEventUseCase({required this.eventRepository});

  Future<Result<String>> invoke({
    required List<MultipartFile> files,
    required String title,
    required String description,
    required String startTime,
  }) async {
    return await eventRepository.createEvent(
      files: files,
      title: title,
      description: description,
      startTime: startTime,
    );
  }
}
