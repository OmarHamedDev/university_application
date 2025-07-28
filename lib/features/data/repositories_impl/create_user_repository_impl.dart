import 'package:dio/src/multipart_file.dart';
import 'package:hti_university_app_1/core/api/network/common/execute_method.dart';
import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/data/data_source/remote_data_source/create_remote_data_source/create_remote_data_source.dart';
import 'package:hti_university_app_1/features/data/model/request/create_single_use/create_single_use_request.dart';
import 'package:hti_university_app_1/features/domain/repositories/create_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreateRepository)
class CreateRepositoryImpl implements CreateRepository {
  final CreateRemoteDataSource _createRemoteDataSource;
  CreateRepositoryImpl(this._createRemoteDataSource);
  @override
  Future<Result<String>> createSingleUser(
    CreateSingleUseRequest createSingleUseRequest,
  ) async {
    return executeMethod<String>(
      callMethod: () async {
        var response = await _createRemoteDataSource.createUser(
          createSingleUseRequest,
        );
        return response;
      },
    );
  }

  @override
  Future<Result<String>> uploadExcel(List<MultipartFile> files) async {
    return executeMethod<String>(
      callMethod: () async {
        var response = await _createRemoteDataSource.uploadExcel(files);
        return response;
      },
    );
  }
}
