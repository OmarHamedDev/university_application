import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/utils/functions/handle_state/handle_state.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/menu_tab/accepted_request/view_model/accepted_request_cubit.dart';

class AcceptedRequests extends StatefulWidget {
  const AcceptedRequests({super.key});

  @override
  State<AcceptedRequests> createState() => _AcceptedRequestsState();
}

class _AcceptedRequestsState extends State<AcceptedRequests> {
  var acceptedRequests = getIt.get<AcceptedRequestCubit>();
  @override
  void initState() {
    super.initState();
    acceptedRequests.getAllAcceptedRequestsAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AcceptedRequestCubit>(
      create: (context) => acceptedRequests,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Accepted requests',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),

        backgroundColor: Colors.white,
        body: BlocBuilder<AcceptedRequestCubit, AcceptedRequestState>(
          builder: (context, state) {
            if (state is GetAllAcceptedRequestsAdminLoading) {
              return HandleState.loading();
            } else if (state is GetAllAcceptedRequestsAdminError) {
              return HandleState.error(state.exception, context);
            }
            return HandleState.emptyList(
              child: _buildSuccessState(),
              list: acceptedRequests.acceptedRequests,
              message: "Accepted Requests is Empty",
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
        itemCount: acceptedRequests.acceptedRequests.length,
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
                    //"",
                    acceptedRequests.acceptedRequests[index].studentNameEn ??
                        "",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(Icons.check, size: 24, color: Colors.green),
              ],
            ),
          );
        },
      ),
    );
  }
}
