import 'package:dio/dio.dart';
import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/admin_student_request_repository.dart';

@injectable
class CreateStudentRequestUseCase {
  final AdminStudentRequestRepository _adminStudentRequestRepository;
  CreateStudentRequestUseCase(this._adminStudentRequestRepository);

  Future<Result<String>> invoke({
    required List<MultipartFile> files,
    required int requestId,
    required int count,
    required String studentNameAr,
    required String studentNameEn,
    required String department,
    required int studentId,
  }) {
    return _adminStudentRequestRepository.addRequestTypeStudent(
      files: files,
      requestId: requestId,
      count: count,
      studentNameAr: studentNameAr,
      studentNameEn: studentNameEn,
      department: department,
      studentId: studentId,
    );
  }
}
