import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import '../../../../../../../core/utils/constants/App_colors.dart';
import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import 'confirm_requests_admin.dart';
import '../view_model/regiect_request_view_model/regiect_request_cubit.dart';

class AdminRequests extends StatefulWidget {
  @override
  State<AdminRequests> createState() => _AdminRequestsState();
}

class _AdminRequestsState extends State<AdminRequests> {
  var regiectReqeustViewModel = getIt.get<RegiectRequestCubit>();

  @override
  void initState() {
    regiectReqeustViewModel.getAllPendingRequestsAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => regiectReqeustViewModel,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: BlocBuilder<RegiectRequestCubit, RegiectRequestState>(
          builder: (context, state) {
            if (state is RegiectRequestLoading) {
              return HandleState.loading();
            } else if (state is RegiectRequestError) {
              return HandleState.error(state.message, context);
            } else {
              return HandleState.emptyList(
                child: _buildSuccess(),
                message: "Empty List Pending Requests",
                paddingTop: 0,
                list: regiectReqeustViewModel.requests,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildSuccess() {
    return ListView.builder(
      itemCount: regiectReqeustViewModel.requests.length,
      itemBuilder: (context, index) {
        final request = regiectReqeustViewModel.requests[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
          child: Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.event_note_outlined, size: 24),
              title: Text(
                request.studentNameEn ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(request.totalPrice ?? ""),
              onTap: ()async {
               var  success =await Navigator.of(context).pushNamed(ConfirmRequestsAdmin.routeName,
                    arguments: request.requestId ?? 0
                );
               if(success == true){
                 regiectReqeustViewModel.getAllPendingRequestsAdmin();
               }
              },
            ),
          ),
        );
      },
    );
  }
}

class RequestModel {
  final String title;
  final String date;

  RequestModel({required this.title, required this.date});
}
