import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';

import '../../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../view_model/regiected_request_cubit.dart';

class RejectedRequests extends StatefulWidget {
  const RejectedRequests({super.key});

  @override
  State<RejectedRequests> createState() => _RejectedRequestsState();
}

class _RejectedRequestsState extends State<RejectedRequests> {
  var regictedViewModel = getIt.get<RegiectedRequestCubit>();
  @override
  void initState() {
    super.initState();
    regictedViewModel.getAllRegictedRequestsAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => regictedViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rejected requests',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<RegiectedRequestCubit, RegiectedRequestState>(
          builder: (context, state) {
            if (state is GetAllRejectedRequestsAdminLoading) {
              return HandleState.loading();
            } else if (state is GetAllRejectedRequestsAdminError) {
              return HandleState.error(state.exception, context);
            }
            return HandleState.emptyList(
              child: _buildSuccessState(),
              list: regictedViewModel.adminStudentRequected,
              message: "Rejected Requests is Empty",
              paddingTop: 0,
            );
          },
        ),
      ),
    );
  }

  Widget _buildSuccessState() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: regictedViewModel.adminStudentRequected.length,
        separatorBuilder: (_, __) => const SizedBox(height: 30),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    regictedViewModel
                            .adminStudentRequected[index]
                            .studentNameEn ??
                        "",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(Icons.close, size: 24, color: Colors.red),
              ],
            ),
          );
        },
      ),
    );
  }
}
