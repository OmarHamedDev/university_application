import 'package:hti_university_app_1/features/domain/entities/request_type_entity.dart';
import 'package:injectable/injectable.dart';

import '../model/response/request_type_response_model/request_type_response_model.dart';

abstract class RequestTypeMapper {
  List<RequestTypeEntity> mapRequestTypeResponseModelToEntity(
    RequestTypeResponseModel requestTypeResponseModel,
  );
}

@Injectable(as: RequestTypeMapper)
class RequestTypeMapperImpl implements RequestTypeMapper {
  @override
  List<RequestTypeEntity> mapRequestTypeResponseModelToEntity(
    RequestTypeResponseModel requestTypeResponseModel,
  ) {
    if (requestTypeResponseModel.types!.isEmpty) {
      return [];
    } else {
      return requestTypeResponseModel.types!
          .map(
            (e) => RequestTypeEntity(
              id: e.id ?? 0,
              name: e.name ?? "",
              price: e.price ?? "",
              createdAt: e.createdAt ?? "",
              updatedAt: e.updatedAt ?? "",
              description: e.description ?? "",
            ),
          )
          .toList();
    }
  }
}
