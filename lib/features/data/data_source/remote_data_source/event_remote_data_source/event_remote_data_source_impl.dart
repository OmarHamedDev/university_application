import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../api/api_manger.dart';
import '../../../mapper/event_mapper.dart';
import '../../../model/response/event_response_model/event_response_model.dart';
import 'event_remote_data_source.dart';
@Injectable(as: EventRemoteDataSource)
class EventRemoteDataSourceImpl implements EventRemoteDataSource{
  final ApiManger apiManger;
  final EventMapper eventMapper;
  EventRemoteDataSourceImpl(this.apiManger, this.eventMapper);
  @override
  Future<List<EventEntity>> getAllEvents() async{
    List<EventResponseModel> events = await apiManger.getAllEvents();
    return eventMapper.mapEventResponseModelToEntity(events);
  }
}