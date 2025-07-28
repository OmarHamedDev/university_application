import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../../../../core/api/network/error/error_handler.dart';
import '../../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../home/admin_home_screen.dart';
import '../view_model/upload_sheet_cubit.dart';

class UpdateSheetView extends StatefulWidget {
  const UpdateSheetView({super.key});

  @override
  State<UpdateSheetView> createState() => _UpdateSheetViewState();
}

class _UpdateSheetViewState extends State<UpdateSheetView> {
  var colorBorder = Colors.grey;
  final formKey = GlobalKey<FormState>();
  MultipartFile? fileImage;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var uploadFileCubit = getIt.get<UploadSheetCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => uploadFileCubit,
      child: BlocListener<UploadSheetCubit, UploadSheetState>(
        listener: (context, state) {
          if (state is UploadSheetLoading) {
            LoadingDialog.showLoadingDialog(context);
          } else if (state is UploadSheetSuccess) {
            Navigator.pop(context); // Close the loading dialog
            LoadingDialog.showSuccessDialog(
              context,
              message: "File uploaded successfully",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AdminHomeScreen.routeName,
                  (route) => false,
                );
              },
            );
          } else if (state is UploadSheetError) {
            Navigator.pop(context);
            final message = ErrorHandler.formException(state.error);
            LoadingDialog.showErrorDialog(
              context,
              message: message.errorMassage,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Update Sheet",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) => value!.isEmpty ? 'Title is required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Description is required' : null,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorBorder),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    child: TextButton.icon(
                      icon: const Icon(Icons.upload_file, color: Colors.grey),
                      label: const Text(
                        "Upload Excel File",
                        style: TextStyle(color: Colors.grey),
                      ),
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['xlsx'],
                            );

                        if (result != null &&
                            result.files.single.path != null) {
                          String path = result.files.single.path!;
                          String selectedFileName = result.files.single.name;

                          final pickedFile = MultipartFile.fromFileSync(
                            path,
                            filename: selectedFileName,
                            contentType: MediaType(
                              'application',
                              'vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                            ),
                          );

                          setState(() {
                            fileImage = pickedFile;
                            colorBorder = Colors.green;
                          });
                        } else {
                          setState(() {
                            fileImage = null;
                            colorBorder = Colors.grey;
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (fileImage == null) {
                            showAwesomeDialog(
                              context,
                              title: "Error",
                              desc: "Please upload file",
                              onOk: () {},
                              dialogType: DialogType.error,
                            );
                            return;
                          }

                          if (formKey.currentState!.validate()) {
                            uploadFileCubit.uploadSheet(upload: [fileImage!]);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Upload",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
