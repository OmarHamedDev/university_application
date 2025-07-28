import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/api/network/error/error_handler.dart';
import 'package:hti_university_app_1/core/widgets/cached_network_image_widget.dart';
import '../../../../../../core/utils/constants/App_colors.dart';
import '../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../../../../../dependency_inversion/di.dart';
import '../view_model/confirem_request/confirm_request_cubit.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/requests/view/Reject_Reason.dart';

class ConfirmRequestsAdmin extends StatefulWidget {
  static const String routeName = 'conf';

  @override
  State<ConfirmRequestsAdmin> createState() => _ConfirmRequestsAdminState();
}

class _ConfirmRequestsAdminState extends State<ConfirmRequestsAdmin> {
  final List<String> imageUrls = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5cc7LiMlrjUGIGQ6XfIk9wiSzzOFkoskSu2EA2W2F99kzAPnB_vETl88jQ5nz5QHKcmY&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5cc7LiMlrjUGIGQ6XfIk9wiSzzOFkoskSu2EA2W2F99kzAPnB_vETl88jQ5nz5QHKcmY&usqp=CAU",
  ];

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$title:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }

  var confirmCubit = getIt.get<ConfirmRequestCubit>();

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => confirmCubit..getAllPendingRequestsAdmin(arguments),
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: Text("Confirm Your Request"),
          leading: BackButton(),
        ),
        body: BlocConsumer<ConfirmRequestCubit, ConfirmRequestState>(
          listener: (context, state) {
            if (state is AcceptRequestErrorState) {
              LoadingDialog.hideLoadingDialog(context);
              showAwesomeDialog(
                context,
                title: " Error",
                desc: ErrorHandler.formException(state.exception).errorMassage,
                onOk: () {
                  //cubit.deleteNews(id: news.id ?? 0);
                },
                dialogType: DialogType.error,
              );
            }
            if (state is AcceptRequestSuccessState) {
              LoadingDialog.hideLoadingDialog(context);
              showAwesomeDialog(
                context,
                title: " Success",
                desc: "Accepted successfully",
                onOk: () {
                  Navigator.pop(context, true);
                },
                dialogType: DialogType.success,
              );
            }
            if (state is AcceptRequestLoadingState) {
              LoadingDialog.showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            if (state is GetAllConfirmRequestLoadingState) {
              return HandleState.loading();
            } else if (state is GetAllConfirmRequestErrorState) {
              return HandleState.error(state.exception, context);
            } else {
              return _buildSuccess();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSuccess() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Requests Information:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  buildInfoRow(
                    "Requests Number",
                    (confirmCubit.requests.requestId.toString()),
                  ),
                  buildInfoRow(
                    "Requests Description",
                    (confirmCubit.requests.typeName.toString()),
                  ),
                  buildInfoRow(
                    "Requests Count",
                    (confirmCubit.requests.count.toString()),
                  ),
                  // buildInfoRow(
                  //   "Requests Price",
                  //   confirmCubit.requests..toStringAsFixed(2),
                  // ),
                  buildInfoRow(
                    "Requests Total Price",
                    confirmCubit.requests.totalPrice.toString(),
                  ),
                  // buildInfoRow("Requests Date", requestDate),
                  buildInfoRow(
                    "Requests Status",
                    confirmCubit.requests.status.toString(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Student Information:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  buildInfoRow(
                    "Student Arabic Name",
                    confirmCubit.requests.studentNameAr.toString(),
                  ),
                  buildInfoRow(
                    "Student English Name",
                    confirmCubit.requests.studentNameEn.toString(),
                  ),
                  buildInfoRow(
                    "Student Status",
                    confirmCubit.requests.status.toString(),
                  ),
                  buildInfoRow(
                    "Student Depertment",
                    confirmCubit.requests.department.toString(),
                  ),
                  // buildInfoRow("Student ID", studentId),
                  // buildInfoRow("Student Email", studentEmail),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Requests Images:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("press on the photo to see it in fullscreen."),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImageWidget(
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: confirmCubit.requests.receiptImage ?? "",
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    showAwesomeDialog(
                      context,
                      title: "Accept",
                      desc: "Are you sure you want to accept this request?",
                      onOk: () {
                        confirmCubit.acceptRequest(
                          id: confirmCubit.requests.requestId ?? 0,
                          delivery_date: "2025-08-01",
                        );
                      },
                      onCancel: () {},
                      dialogType: DialogType.question,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.babyBlue,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Accept",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).pushNamed(RejectReason.routeName, arguments: confirmCubit.requests.requestId ?? 0);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Reject",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
