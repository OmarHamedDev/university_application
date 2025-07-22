import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/data/data_source/remote_data_source/event_remote_data_source/event_remote_data_source.dart';
import 'package:hti_university_app_1/features/data/model/response/event_response_model/event_response_model.dart';
import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';
import 'package:hti_university_app_1/features/domain/repositories/event_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/network/common/execute_method.dart';
@Injectable(as: EventRepository)
class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource _eventRemoteDataSource;
  EventRepositoryImpl(this._eventRemoteDataSource);
  @override
  Future<Result<List<EventEntity>>> getAllEvents() async {
    return await executeMethod<List<EventEntity>>(
      callMethod: () async {
        var events = await _eventRemoteDataSource.getAllEvents();
        return events;
      },
    );
  }
}
