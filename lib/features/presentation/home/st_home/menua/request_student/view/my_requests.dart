import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import '../../../../../../../core/utils/constants/App_colors.dart';
import '../../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../../../ad_home/menu_tab/manage_request/view/manage request.dart';
import '../view_model/request_studnet_cubit.dart';

class MyRequestsStudent extends StatefulWidget {
  static const String routeName = 'myRequest';

  const MyRequestsStudent({super.key});

  @override
  State<MyRequestsStudent> createState() => _MyRequestsStudent();
}

class _MyRequestsStudent extends State<MyRequestsStudent> {
  var getAllStudentRequest = getIt.get<RequestStudnetCubit>();

  @override
  initState() {
    getAllStudentRequest.getAllRequestsTypeAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getAllStudentRequest,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "My Requests",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        body: BlocBuilder<RequestStudnetCubit, RequestStudnetState>(
          builder: (context, state) {
            if (state is GetAllRequestStudentLoading) {
              return HandleState.loading();
            } else if (state is GetAllRequestStudentError) {
              return HandleState.error(state.error, context);
            } else {
              return HandleState.emptyList(
                child: _buildSuccess(),
                message: "Empty List Pending Requests",
                paddingTop: 0,
                list: getAllStudentRequest.requests,
              );
            }
            return Container();
          },
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
              // Expanded(
              //   child: ElevatedButton(
              //     onPressed: () async {
              //
              //       if(isRequest == true){
              //         getAllStudentRequest.getAllRequestsTypeAdmin();
              //       }
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.blue,
              //       padding: EdgeInsets.symmetric(vertical: 12),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //     child: const Text(
              //       'Add new requests',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
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
              itemCount: getAllStudentRequest.requests.length,
              separatorBuilder: (_, __) => SizedBox(height: 20),
              itemBuilder: (context, index) {
                final item = getAllStudentRequest.requests[index];
                return RequestCard1(
                  name: item.studentNameEn ?? "",
                  price: item.status.toString(),
                  onDelete: () {},
                  onEdit: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RequestCard1 extends StatelessWidget {
  final String name;
  final String price;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const RequestCard1({
    Key? key,
    required this.name,
    required this.price,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// اسم الطالب
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            /// السعر
            Text('Status: ${price}', style: TextStyle(fontSize: 14)),

            SizedBox(height: 8),

            /// صورة الإيصال (لو موجودة)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://mobcity.net/laravel_api/public/storage/receipts/P1XTAtLDoZP42TTi9qCfVvshdqx7ZfgFkflNaqes.png",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 12),

            /// الأزرار
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     TextButton.icon(
            //       onPressed: onEdit,
            //       icon: Icon(Icons.edit, color: Colors.blue),
            //       label: Text("تعديل", style: TextStyle(color: Colors.blue)),
            //     ),
            //     const SizedBox(width: 8),
            //     TextButton.icon(
            //       onPressed: onDelete,
            //       icon: Icon(Icons.delete, color: Colors.red),
            //       label: Text("حذف", style: TextStyle(color: Colors.red)),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
