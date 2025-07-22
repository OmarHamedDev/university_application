
import 'package:injectable/injectable.dart';

import '../../domain/entities/event_entity.dart';
import '../model/response/event_response_model/event_response_model.dart';

abstract class EventMapper {
  List<EventEntity> mapEventResponseModelToEntity(
    List<EventResponseModel> eventResponseModel,
  );
}

@Injectable(as: EventMapper)
class EventMapperImpl implements EventMapper {
  @override
  List<EventEntity> mapEventResponseModelToEntity(
    List<EventResponseModel> eventResponseModel,
  ) {
    return eventResponseModel
        .map(
          (eventResponseModel) => EventEntity(
            id: eventResponseModel.id ?? 0,
            title: eventResponseModel.title ?? '',
            content: eventResponseModel.description ?? '',
            createdAt: eventResponseModel.createdAt ?? '',
            image: eventResponseModel.image ?? '',
            updatedAt: eventResponseModel.updatedAt ?? '',
          ),
        )
        .toList();
  }
}
