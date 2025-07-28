class AdminStudentRequestEntity {
  final int? requestId;
  final String? typeId;
  final String? typeName;
  final String? count;
  final String? totalPrice;
  final String? status;
  final String? adminStatus;
  final String? studentNameEn;
  final String? studentNameAr;
  final String? department;
  final String? receiptImage;

  AdminStudentRequestEntity({
    this.requestId,
    this.typeId,
    this.typeName,
    this.count,
    this.totalPrice,
    this.status,
    this.adminStatus,
    this.studentNameEn,
    this.studentNameAr,
    this.department,
    this.receiptImage,
  });
}
