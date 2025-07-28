import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/event_repository.dart';

@injectable
class DeleteEventUseCase {
  final EventRepository eventRepository;
  DeleteEventUseCase({required this.eventRepository});
  Future<Result<String>> invoke({required int id}) async {
    return await eventRepository.deleteEvent(id: id);
  }
}
