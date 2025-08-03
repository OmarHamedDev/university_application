import 'package:dio/src/response.dart';
import 'package:hti_university_app_1/core/api/addition/serviceApi.dart';
import 'package:hti_university_app_1/features/domain/repositories/graduates_repo.dart';

class GraduatesRepoImp implements GraduatesRepo{
  final ServiceAPIs serviceAPIs;

  GraduatesRepoImp(this.serviceAPIs);

  @override
  Future<Response> graduateById({required String id}) async {
    final response =await serviceAPIs.graduateById(id: id);
    return response;
  }

  @override
  Future<Response> graduates() async {
    final response =await serviceAPIs.graduates();
    return response;
  }

}