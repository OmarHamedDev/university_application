import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/utils/functions/validators/validations.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/menu_tab/manage_request/view_model/add_request_type/add_request_type_cubit.dart';

import '../../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../data/model/request/request_type_request/RequestTypeRequestModel.dart';

class AddRequests extends StatefulWidget {
  const AddRequests({super.key});

  @override
  State<AddRequests> createState() => _AddRequestsState();
}

class _AddRequestsState extends State<AddRequests> {
  var addRequestCubit = getIt.get<AddRequestTypeCubit>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addRequestCubit,
      child: BlocListener<AddRequestTypeCubit, AddRequestTypeState>(
        listener: (context, state) {
          if (state is AddRequestTypeLoading) {
            LoadingDialog.showLoadingDialog(context);
          } else if (state is AddRequestTypeSuccess) {
            LoadingDialog.hideLoadingDialog(context);
            showAwesomeDialog(
              context,
              title: "Success",
              desc: "News created successfully",
              onOk: () {
                Navigator.pop(context, true);
              },
              dialogType: DialogType.success,
            );
          } else if (state is AddRequestTypeError) {
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
                          print("omar");
                          if (formKey.currentState!.validate()) {
                            addRequestCubit.addRequestType(
                             requestTypeRequestModel:  RequestTypeRequestModel(
                                name: nameController.text,
                                price:int.parse(priceController.text),
                                description: descriptionController.text,                              )
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
                          "Create",
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
