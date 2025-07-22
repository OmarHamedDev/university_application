import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/event_repository.dart';
@injectable
class GetAllEventUseCase {
  final EventRepository eventRepository;
  GetAllEventUseCase({required this.eventRepository});
  Future<Result<List<EventEntity>>>invoke()async{
    return await eventRepository.getAllEvents();
  }
}