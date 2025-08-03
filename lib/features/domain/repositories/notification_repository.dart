import 'package:dio/dio.dart';

abstract class Notification{
  Future<Response> notification();
}