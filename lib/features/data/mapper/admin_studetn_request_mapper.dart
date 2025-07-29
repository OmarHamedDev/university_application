import 'package:injectable/injectable.dart';

import '../../domain/entities/admin_student_request_entity.dart';
import '../../domain/entities/panding_request_enitiy.dart';
import '../../domain/entities/request_type_entity.dart';
import '../model/response/admin_panding_response_model/admin_panding_response_model.dart';
import '../model/response/admin_student_request_reseponse_model/admin_student_request_response_model.dart';
import '../model/response/get_all_student_request_response_model/get_all_student_request_response_model.dart';
import '../model/response/request_type_response_model/request_type_response_model.dart';
import '../model/response/student_request_response_model/StudentRequestResponseModel.dart';

abstract class AdminStudentRequestMapper {
  List<AdminStudentRequestEntity> mapAdminStudentRequestResponseModelToEntity(
    AdminStudentRequestResponseModel adminStudentRequestResponseModel,
  );
  PandingRequestEnitiy mapPandingRequestResponseModelToEntity(
    AdminPandingResponseModel adminPandingResponseModel,
  );

  List<AdminStudentRequestEntity> mapStudentRequestResponseModelToEntity(
    Student_request_response_model studentRequestResponseModel,
  );
  List<RequestTypeEntity> mapRequestTypeResponseModelToEntity(
      GetAllStudentRequestResponseModel getAllStudentRequestResponseModel);
}

@Injectable(as: AdminStudentRequestMapper)
class AdminStudentRequestMapperImpl implements AdminStudentRequestMapper {
  @override
  List<AdminStudentRequestEntity> mapAdminStudentRequestResponseModelToEntity(
    AdminStudentRequestResponseModel adminStudentRequestResponseModel,
  ) {
    if (adminStudentRequestResponseModel.requests!.isEmpty) {
      return [];
    }
    return adminStudentRequestResponseModel.requests!.map((e) {
      return AdminStudentRequestEntity(
        adminStatus: e.adminStatus ?? "",
        count: e.count ?? "",
        department: e.department ?? "",
        receiptImage: e.receiptImage ?? "",
        requestId: e.requestId ?? 0,
        status: e.status ?? "",
        studentNameAr: e.studentNameAr ?? "",
        studentNameEn: e.studentNameEn ?? "",
        totalPrice: e.totalPrice ?? "",
        typeId: e.typeId ?? "",
        typeName: e.typeName ?? "",
      );
    }).toList();

    // return adminStudentRequestResponseModel.expand((model) =>
    //     (model.requests ?? []).map((e) => AdminStudentRequestEntity(
    //       adminStatus: e.adminStatus ?? "",
    //       count: e.count ?? "",
    //       department: e.department ?? "",
    //       receiptImage: e.receiptImage ?? "",
    //       requestId: e.requestId ?? 0,
    //       status: e.status ?? "",
    //       studentNameAr: e.studentNameAr ?? "",
    //       studentNameEn: e.studentNameEn ?? "",
    //       totalPrice: e.totalPrice ?? "",
    //       typeId: e.typeId ?? "",
    //       typeName: e.typeName ?? "",
    //     ))).toList();
  }

  @override
  PandingRequestEnitiy mapPandingRequestResponseModelToEntity(
    AdminPandingResponseModel adminPandingResponseModel,
  ) {
    return PandingRequestEnitiy(
      notes: adminPandingResponseModel.request?.notes ?? "",
      count: adminPandingResponseModel.request?.count ?? "",
      department: adminPandingResponseModel.request?.department ?? "",
      receiptImage: adminPandingResponseModel.request?.receiptImage ?? "",
      requestId: adminPandingResponseModel.request?.requestId ?? 0,
      status: adminPandingResponseModel.request?.status ?? "",
      studentNameAr: adminPandingResponseModel.request?.studentNameAr ?? "",
      studentNameEn: adminPandingResponseModel.request?.studentNameEn ?? "",
      totalPrice: adminPandingResponseModel.request?.totalPrice ?? "",
      typeId: adminPandingResponseModel.request?.typeId ?? "",
      typeName: adminPandingResponseModel.request?.typeName ?? "",
    );
  }

  @override
  List<AdminStudentRequestEntity> mapStudentRequestResponseModelToEntity(
    Student_request_response_model studentRequestResponseModel,
  ) {
    if (studentRequestResponseModel.requests!.isEmpty) {
      return [];
    } else {
      return studentRequestResponseModel.requests!.map((e) {
        return AdminStudentRequestEntity(
          adminStatus: "",
          count: e.count ?? "",
          department: e.department ?? "",
          receiptImage: e.receiptImage ?? "",
          requestId: e.requestId ?? 0,
          status: e.status ?? "",
          studentNameAr: e.studentNameAr ?? "",
          studentNameEn: e.studentNameEn ?? "",
          totalPrice: e.totalPrice ?? "",
          typeId: e.typeId ?? "",
          typeName: e.typeName ?? "",
        );
      }).toList();
    }
  }

  @override
  List<RequestTypeEntity> mapRequestTypeResponseModelToEntity(GetAllStudentRequestResponseModel getAllStudentRequestResponseModel) {
    if (getAllStudentRequestResponseModel.requests!.isEmpty) {
      return [];
    }
   return getAllStudentRequestResponseModel.requests!.map((e) => RequestTypeEntity(
     id: e.id ?? 0,
     name: e.name ?? "",
     price: e.price ?? "",
     createdAt: e.createdAt ?? "",
     updatedAt: e.updatedAt ?? "",
     description: e.description ?? "",
   )).toList();

  }

}