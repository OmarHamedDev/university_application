import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/utils/functions/validators/validations.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/menu_tab/manage_request/view_model/add_request_type/add_request_type_cubit.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/menu_tab/manage_request/view_model/update_request_type/update_request_type_cubit.dart';

import '../../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../data/model/request/request_type_request/RequestTypeRequestModel.dart';

class UpdateRequest extends StatefulWidget {
  final int id;
  const UpdateRequest({super.key ,this.id=0});

  @override
  State<UpdateRequest> createState() => _UpdateRequestsState();
}

class _UpdateRequestsState extends State<UpdateRequest> {
  var updateRequestTypeCubit = getIt.get<UpdateRequestTypeCubit>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => updateRequestTypeCubit,
      child: BlocListener<UpdateRequestTypeCubit, UpdateRequestTypeState>(
        listener: (context, state) {
          if (state is UpdateRequestTypeLoading) {
            LoadingDialog.showLoadingDialog(context);
          } else if (state is UpdateRequestTypeSuccess) {
            LoadingDialog.hideLoadingDialog(context);
            showAwesomeDialog(
              context,
              title: "Success",
              desc: "News Updated successfully",
              onOk: () {
                Navigator.pop(context, true);
              },
              dialogType: DialogType.success,
            );
          } else if (state is UpdateRequestTypeError) {
            LoadingDialog.hideLoadingDialog(context);
            showAwesomeDialog(
              context,
              title: "Error",
              desc: state.exception.toString(),
              onOk: () {},
              dialogType: DialogType.error,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Add new request",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: nameController,
                    validator: Validations.validateTextIsEmpty,
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 16),

                  const Text("Price"),
                  const SizedBox(height: 6),
                  TextFormField(
                    validator: Validations.validateTextIsEmpty,
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 16),

                  const Text("Description"),
                  const SizedBox(height: 6),
                  TextFormField(
                    validator: Validations.validateTextIsEmpty,
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Create Button
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            updateRequestTypeCubit.updateRequestType(
                              id: widget.id ?? 0,
                              requestTypeRequestModel: RequestTypeRequestModel(
                                name: nameController.text,
                                price: int.parse(priceController.text),
                                description: descriptionController.text,
                              ),
                            );
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
                          "update",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      // Cancel Button
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

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
