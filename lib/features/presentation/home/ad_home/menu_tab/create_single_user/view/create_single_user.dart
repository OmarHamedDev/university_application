import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/api/network/error/error_handler.dart';
import '../../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../../dependency_inversion/di.dart';
import '../../../../../../data/model/request/create_single_use/create_single_use_request.dart';
import '../view_model/create_single_user_cubit.dart';

class CreateSingleUser extends StatefulWidget {
  const CreateSingleUser({super.key});

  @override
  State<CreateSingleUser> createState() => _CreateSingleUserState();
}

class _CreateSingleUserState extends State<CreateSingleUser> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final personalEmailController = TextEditingController();
  final phoneController = TextEditingController();
  final typeController = TextEditingController();
  final majorController = TextEditingController();
  final passwordController = TextEditingController();

  var createSingleCubit = getIt.get<CreateSingleUserCubit>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    personalEmailController.dispose();
    phoneController.dispose();
    typeController.dispose();
    majorController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      CreateSingleUseRequest createSingleUseRequest = CreateSingleUseRequest(
        name: nameController.text,
        email: emailController.text,
        personalEmail: personalEmailController.text,
        phoneNumber: phoneController.text,
        type: typeController.text,
        major: majorController.text,
        password: passwordController.text,
      );
      createSingleCubit.createSingleUser(createSingleUseRequest);
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    IconData? icon,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon) : null,
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator:
            (value) => value == null || value.isEmpty ? 'Required field' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createSingleCubit,
      child: BlocListener<CreateSingleUserCubit, CreateSingleUserState>(
        listener: (context, state) {
          if (state is CreateSingleUserLoading) {
            LoadingDialog.showLoadingDialog(context);
          } else if (state is CreateSingleUserError) {
            LoadingDialog.hideLoadingDialog(context);
            showAwesomeDialog(
              context,
              title: "Success",
              desc: " created Single User successfully",
              onOk: () {
                Navigator.pop(context, true);
              },
              dialogType: DialogType.success,
            );
          } else if (state is CreateSingleUserError) {
            LoadingDialog.hideLoadingDialog(context);
            showAwesomeDialog(
              context,
              title: "Error",
              desc: ErrorHandler.formException(state.error).errorMassage,
              onOk: () {},
              dialogType: DialogType.error,
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
            title: const Text('Create Single User'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildTextField(
                    label: 'Name',
                    controller: nameController,
                    icon: Icons.person,
                  ),
                  _buildTextField(
                    label: 'Email',
                    controller: emailController,
                    icon: Icons.email,
                  ),
                  _buildTextField(
                    label: 'Personal Email',
                    controller: personalEmailController,
                    icon: Icons.alternate_email,
                  ),
                  _buildTextField(
                    label: 'Phone Number',
                    controller: phoneController,
                    icon: Icons.phone,
                  ),
                  _buildTextField(
                    label: 'Type (e.g. graduate)',
                    controller: typeController,
                    icon: Icons.group,
                  ),
                  _buildTextField(
                    label: 'Major',
                    controller: majorController,
                    icon: Icons.school,
                  ),
                  _buildTextField(
                    label: 'Password',
                    controller: passwordController,
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _submitForm,
                    icon: const Icon(Icons.save),
                    label: const Text("Create User"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
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
