import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import 'package:hti_university_app_1/features/domain/entities/news_entity.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/news_tab/view_model/admin_news_cubit.dart';

import '../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../core/utils/functions/validators/validations.dart';
import '../view_model/add_news_admin/add_news_admin_cubit.dart';

class AddNewNewsAdmin extends StatefulWidget {
  const AddNewNewsAdmin({super.key});

  @override
  State<AddNewNewsAdmin> createState() => _AddNewNewsState();
}

class _AddNewNewsState extends State<AddNewNewsAdmin> {
  var addNewsCubit = getIt.get<AddNewsAdminCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addNewsCubit,
      child: BlocListener<AddNewsAdminCubit, AddNewsAdminState>(
        listener: (context, state) {
          _handleBlocListenerCreateNewsState(state);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Add new news_use_case",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Form(
            key: addNewsCubit.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name"),
                  const SizedBox(height: 6),
                  TextFormField(
                    validator:
                        (value) => Validations.validateTextIsEmpty(value),
                    controller: addNewsCubit.titleController,
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 16),

                  const Text("Description"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: addNewsCubit.contentController,
                    validator:
                        (value) => Validations.validateTextIsEmpty(value),
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
                          addNewsCubit.createNews();
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

  dynamic _handleBlocListenerCreateNewsState(AddNewsAdminState state) {
    if (state is CreateAdminNewsLoadingState) {
      LoadingDialog.showLoadingDialog(context);
    } else if (state is CreateAdminNewsSuccessState) {
      LoadingDialog.hideLoadingDialog(context);
      showAwesomeDialog(
        context,
        title: "Success",
        desc: "News created successfully",
        onOk: () {
          Navigator.pop(context,true);
        },
        dialogType: DialogType.success,
      );
    } else if (state is CreateAdminNewsErrorState) {
      LoadingDialog.hideLoadingDialog(context);
      showAwesomeDialog(
        context,
        title: "Error",
        desc: state.exception.toString(),
        onOk: () {},
        dialogType: DialogType.error,
      );
    }
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
