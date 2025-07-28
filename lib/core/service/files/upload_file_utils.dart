import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class FileUtils {
  static Future<void> uploadFile(Function(MultipartFile file) onClick) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );
    if (result != null && result.files.single.path != null) {
      String path = result.files.single.path!;
      String selectedFileName = result.files.single.name;

      final file = MultipartFile.fromFileSync(
        path,
        filename: selectedFileName,
        contentType: MediaType(
          'application',
          'vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        ),
      );
      onClick(file);
    }
  }

  static Future<MultipartFile?> uploadFileFromUrl() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png'], // Customize as needed
    );

    if (result != null && result.files.single.path != null) {
      print("Picked file: ${result.files.single.path}");
      return await MultipartFile.fromFile(result.files.single.path!);
    } else {
      print("No file selected or invalid path");
      return null;
    }
  }

  static Future<MultipartFile?> uploadImageFromUrl() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      String path = result.files.single.path!;
      String fileName = result.files.single.name;
      String mimeType = _getMimeTypeExtension(fileName);

      print("Picked image: $path");

      return await MultipartFile.fromFile(
        path,
        filename: fileName,
        contentType: MediaType('image', mimeType),
      );
    } else {
      print("No image selected or invalid path");
      return null;
    }
  }

  static String _getMimeTypeExtension(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'jpeg';
      case 'png':
        return 'png';
      case 'gif':
        return 'gif';
      default:
        return 'jpeg'; // fallback if unknown
    }
  }
}
