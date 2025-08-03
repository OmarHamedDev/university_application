import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';

import '../../../../../../core/api/network/error/error_handler.dart';
import '../../../../../../core/service/files/upload_file_utils.dart';
import '../../../../../../core/utils/constants/App_colors.dart';
import '../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../core/widgets/buttons/next_button.dart';
import '../view_model/confirm_st_request/confirm_st_request_cubit.dart';

class ConfirmRequest extends StatefulWidget {
  static const String routeName = 'confirm';
  final String title;
  final String price;
  final int id;
  const ConfirmRequest({
    super.key,
    required this.title,
    required this.price,
    required this.id,
  });

  @override
  State<ConfirmRequest> createState() => _ConfirmRequestState();
}

class _ConfirmRequestState extends State<ConfirmRequest> {
  int count = 1;
  TextEditingController nameEnglishController = TextEditingController();
  TextEditingController nameArabicController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  @override
  void dispose() {
    nameEnglishController.dispose();
    nameArabicController.dispose();
    departmentController.dispose();
    studentIdController.dispose();
    super.dispose();
  }

  MultipartFile? fileImage;
  var colorBorder = Colors.grey;

  var formKey = GlobalKey<FormState>();
  var confirmRequestCubit = getIt.get<ConfirmStRequestCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => confirmRequestCubit,
      child: BlocListener<ConfirmStRequestCubit, ConfirmStRequestState>(
        listener: (context, state) {
          if (state is ConfirmStRequestLoading) {
            LoadingDialog.showLoadingDialog(context);
          } else if (state is ConfirmStRequestSuccess) {
            LoadingDialog.hideLoadingDialog(context);
            showAwesomeDialog(
              context,
              title: "Success",
              desc: "Confirm Request created successfully",
              onOk: () {
                Navigator.pop(context, true);
              },
              dialogType: DialogType.success,
            );
          } else if (state is ConfirmStRequestError) {
            LoadingDialog.hideLoadingDialog(context);
            var error=ErrorHandler.formException(state.message);
            if(error.code==409){
              showAwesomeDialog(
                context,
                title: "Error",
                desc: "You already submitted this request and it is still pending",
                onOk: () {
                  Navigator.pop(context, true);
                },
                dialogType: DialogType.error,
              );
            }else{
            showAwesomeDialog(
              context,
              title: "Error",
              desc: ErrorHandler.formException(state.message).errorMassage,
              onOk: () {
              },
              dialogType: DialogType.error,
            );
          }}

        },
  child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          surfaceTintColor: AppColors.secondary,
          title: Text("Confirm Your Request"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: [
            Form(
              key: formKey,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Request Info Box
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("R.Description:  ${widget.title}"),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Text("R.Count:  ${count} "),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    if (count == 5) {
                                      return;
                                    }
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                                Text(" $count "),
                                IconButton(
                                  onPressed: () {
                                    if (count == 1) {
                                      return;
                                    }
                                    setState(() {
                                      count--;
                                    });
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              "R.Total Price: ${((double.parse(widget.price)) * count)}",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      // Warning Text
                      Text(
                        'Hint your must deliver to the institute 6 photos 4*6\ncome to institute by self to take the certificate',
                        style: TextStyle(color: Colors.red, fontSize: 13),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Student Information:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      // Input Fields
                      _buildInput("English Name:",nameEnglishController, TextInputType.text),
                      _buildInput("Arabic Name:",nameArabicController, TextInputType.text),
                      _buildInput("Department:" , departmentController, TextInputType.text),
                      // _buildInput("Statues:"),
                      _buildInput("ID:", studentIdController, TextInputType.number),
                      SizedBox(height: 10),
                      // Upload Button
                      SizedBox(
                        width: double.infinity,
                        height: 45,

                        child: NextButton(
                          onTap: () async {
                            MultipartFile? images =
                                await FileUtils.uploadImageFromUrl();
                            setState(() {
                              if (images != null) {
                                fileImage = images;
                                colorBorder = Colors.green;
                              } else {
                                colorBorder = Colors.grey;
                              }
                            });
                          },
                          title: 'Upload The reset',
                        ),
                      ),
                      SizedBox(height: 10),
                      // Placeholder Box
                      // Container(
                      //   height: 100,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey.shade300,
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      // ),
                      // SizedBox(height: 10),
                      // // Send Button
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: NextButton(
                          onTap: () {
                            if (fileImage == null) {
                              showAwesomeDialog(
                                context,
                                title: "Error",
                                desc: "Please upload reset",
                                onOk: () {},
                                dialogType: DialogType.error,
                              );
                              return;
                            }
                            if (formKey.currentState!.validate()) {
                              confirmRequestCubit.confirmRequest(
                                studentNameEn: nameEnglishController.text,
                                studentNameAr: nameArabicController.text,
                                department: departmentController.text,
                                studentId: int.parse(studentIdController.text),
                                count: count,
                                requestId: widget.id,
                                files: [fileImage!],
                              );
                            }
                          },
                          title: 'sent',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
),
    );
  }

  Widget _buildInput(String hint, TextEditingController controller,TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        validator: (value) {
          return value == null || value.isEmpty ? 'Required field' : null;
        },
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
