import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';

import '../../../../../../core/api/network/error/error_handler.dart';
import '../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../home/admin_home_screen.dart';
import '../view_model/regiect_request_view_model/regiect_request_cubit.dart';
import '../view_model/reject_reason/reject_reason_cubit.dart';


class RejectReason extends StatefulWidget {
  const RejectReason({super.key});

  static const String routeName = 'reject';

  @override
  State<RejectReason> createState() => _RejectReasonState();
}

class _RejectReasonState extends State<RejectReason> {
  var rejectReasonCubit = getIt.get<RejectReasonCubit>();
  var controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    //regiectRequestCubit.getAllPendingRequestsAdmin();
  }
  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
  create: (context) => rejectReasonCubit,
  child: BlocListener<RejectReasonCubit, RejectReasonState>(
  listener: (context, state) {
    if (state is RejectReasonError) {
      LoadingDialog.hideLoadingDialog(context);
      showAwesomeDialog(
        context,
        title: " Error",
        desc: ErrorHandler.formException(state.message).errorMassage,
        onOk: () {
          //cubit.deleteNews(id: news.id ?? 0);
        },
        dialogType: DialogType.error,
      );
    }
    if (state is RejectReasonSuccess) {
      LoadingDialog.hideLoadingDialog(context);
      showAwesomeDialog(
        context,
        title: " Success",
        desc: "Accepted successfully",
        onOk: () {
          Navigator.pushNamedAndRemoveUntil(context, AdminHomeScreen.routeName, (route) => false,);
        },
        dialogType: DialogType.success,
      );
    }
    if (state is RejectReasonLoading) {
      LoadingDialog.showLoadingDialog(context);
    }
  },
  child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Reject Reason'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '• Please explain in details the the reason of reject the student Request',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16),
                ),
                child:  Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextFormField(
                    maxLines: 8,
                    controller: controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter reject reason';
                      }
                      return null;
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: 'write here...',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      rejectReasonCubit.rejectRequest(id: id,reason: controller.text);
                    }
                  },
                  child: const Text(
                    'Reject',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
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

  Widget _buildSuccess(){
   return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• Please explain in details the the reason of reject the student Request',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                  hintText: 'write here...',
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Add your reject logic here
              },
              child: const Text(
                'Reject',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
