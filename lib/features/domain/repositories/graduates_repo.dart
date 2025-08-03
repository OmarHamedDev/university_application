import 'package:dio/dio.dart';

abstract class GraduatesRepo{
  Future<Response> graduates();
  Future<Response> graduateById({required String id});
}