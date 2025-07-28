import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/service/files/upload_file_utils.dart';

import '../../../../../../core/api/network/error/error_handler.dart';
import '../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../dependency_inversion/di.dart';
import '../view_model/create_event/create_event_cubit.dart';

class AddNewEvents extends StatefulWidget {
  const AddNewEvents({super.key});

  @override
  State<AddNewEvents> createState() => _AddNewEventsState();
}

class _AddNewEventsState extends State<AddNewEvents> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  var createEvent = getIt.get<CreateEventCubit>();
  var colorBorder=Colors.grey;
   var formKey = GlobalKey<FormState>();
   MultipartFile? fileImage;
   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createEvent,
      child: BlocListener<CreateEventCubit, CreateEventState>(
        listener: (context, state) {
          if (state is CreateEventLoadingState) {
            LoadingDialog.showLoadingDialog(context);
          } else if (state is CreateEventSuccessState) {
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
          } else if (state is CreateEventErrorState) {
            LoadingDialog.hideLoadingDialog(context);
            showAwesomeDialog(
              context,
              title: "Error",
              desc: ErrorHandler.formException(state.massage).errorMassage,
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
              "Add new events",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
               key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name"),
                    const SizedBox(height: 6),
                    TextField(
                      controller: nameController,
                      decoration: _inputDecoration(),
                    ),
                    const SizedBox(height: 16),
            
                    const Text("Date"),
                    const SizedBox(height: 6),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration(),
                    ),
                    const SizedBox(height: 16),
            
                    const Text("Description"),
                    const SizedBox(height: 6),
                    TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: _inputDecoration(),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: colorBorder),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      child: TextButton.icon(
                        icon: const Icon(Icons.camera_alt, color: Colors.grey),
                        label: const Text(
                          "Upload image",
                          style: TextStyle(color: Colors.grey),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () async {
                          MultipartFile  ? images =   await FileUtils.uploadImageFromUrl();
                           setState(() {
                             if(images!=null){
                               fileImage=images;
                               colorBorder=Colors.green;
                             }else{
                               colorBorder=Colors.grey;
                             }
                           });
            
                          },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Create Button
                        ElevatedButton(
                          onPressed: ()async {
                           if(fileImage==null){
                             showAwesomeDialog(
                                context,
                                title: "Error",
                                desc: "Please upload image",
                                onOk: () {},
                                dialogType: DialogType.error,
                              );
                             return;
                           }
                            if(formKey.currentState!.validate()){
                              createEvent.createEvent(
                                title: nameController.text,
                                startTime: "2025-08-01T18:00:00",
                                description: descriptionController.text,
                                files:[ fileImage!],
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
