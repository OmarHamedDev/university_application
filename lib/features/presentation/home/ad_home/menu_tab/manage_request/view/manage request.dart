import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/menu_tab/manage_request/view/update_request.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/menu_tab/manage_request/view_model/mangent_rquest_type/mangent_rquest_type_cubit.dart';
import '../../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../../core/utils/functions/handle_state/handle_state.dart';
import 'add_request.dart' show AddRequests;

class ManageRequests extends StatefulWidget {
  const ManageRequests({super.key});

  @override
  State<ManageRequests> createState() => _ManageRequestsState();
}

class _ManageRequestsState extends State<ManageRequests> {
  var cubit = getIt.get<MangentRquestTypeCubit>();

  @override
  void initState() {
    cubit.getAllRequestType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<MangentRquestTypeCubit, MangentRquestTypeState>(
        listener: (context, state) {
          if (state is DeleteRequestTypeError) {
            showAwesomeDialog(
              context,
              title: " Error",
              desc: "Do you want to delete this news?",
              onOk: () {},

              dialogType: DialogType.warning,
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Mange requests',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            leading: BackButton(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: BlocBuilder<MangentRquestTypeCubit, MangentRquestTypeState>(
            builder: (context, state) {
              if (state is GetAllRequestTypeLoading) {
                return HandleState.loading();
              } else if (state is GetAllRequestTypeError) {
                return HandleState.error(state.exception, context);
              }
              return HandleState.emptyList(
                child: _buildSuccess(),
                list: cubit.requestTypeList,
                message: "Mange Requests is Empty",
                paddingTop: 0,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                 var isRequest =  await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddRequests()),
                    );
                 if(isRequest == true){
                   cubit.getAllRequestType();
                 }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Add new requests',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // SizedBox(width: 12),
              // Expanded(
              //   child: OutlinedButton(
              //     onPressed: () {},
              //     style: OutlinedButton.styleFrom(
              //       foregroundColor: Colors.blue,
              //       padding: EdgeInsets.symmetric(vertical: 12),
              //       side: BorderSide(color: Colors.blue),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //     child: const Text('Update requests'),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 20),

          /// القائمة
          Expanded(
            child: ListView.separated(
              itemCount: cubit.requestTypeList.length,
              separatorBuilder: (_, __) => SizedBox(height: 20),
              itemBuilder: (context, index) {
                final item = cubit.requestTypeList[index];
                return RequestCard(
                  name: item.name ?? "",
                  price: item.price.toString(),
                  onEdit: () async {
                    var isRequest =  await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateRequest(
                      id:    item.id ?? 0,
                      ),

                      ),
                    );
                    if(isRequest == true){
                      cubit.getAllRequestType();
                    }
                  },
                  onDelete: () {
                    showAwesomeDialog(
                      context,
                      title: "Delete Manage Request",
                      desc: "Do you want to delete this request?",
                      onOk: () {
                        cubit.deleteRequestType(id: item.id ?? 0);
                      },
                      onCancel: () {},
                      dialogType: DialogType.question,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final String name;
  final String price;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const RequestCard({
    super.key,
    required this.name,
    required this.price,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.calendar_month_outlined, size: 20),
                SizedBox(width: 8),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                //  Text(content, style: const TextStyle(fontSize: 13)),
                // const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text(
                    //   cubit.formatISOTime(time),
                    //   style: const TextStyle(fontSize: 12, color: Colors.grey),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: onEdit,
                  child: const Icon(Icons.update, color: Colors.red),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: onDelete,
                  child: const Icon(Icons.close, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
