import 'package:dio/src/multipart_file.dart';
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

  @override
  Future<String> deleteEvent(int id) async{
    await apiManger.deleteEvent(id);
    return "Success";
  }

  @override
  Future<String> createEvent({required List<MultipartFile> files, required String title, required String description, required String startTime}) {
    return apiManger.createEvent(files, title, description, startTime);
  }
}