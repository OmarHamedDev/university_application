import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/constants/App_colors.dart';
import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../../../../../dependency_inversion/di.dart';
import '../view_model/st_request/st_request_cubit.dart';
import 'confirm_request.dart';

class RequestsTab extends StatefulWidget {
  @override
  State<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
  final List<Map<String, dynamic>> requests = [
    {'title': 'English Graduation Certificate', 'price': 30},
    {'title': 'Recommendation Later', 'price': 50},
    {'title': 'Arabic Graduation Certificate', 'price': 70},
    {'title': 'English Equation for Subjects', 'price': 100},
    {'title': 'Proof of Registration', 'price': 30},
    {'title': 'Identify Card', 'price': 20},
    {'title': 'Identify Card', 'price': 50},
    {'title': 'Identify Card', 'price': 50},
    {'title': 'Identify Card', 'price': 50},
    {'title': 'Identify Card', 'price': 50},
  ];

  var requestCubit = getIt.get<StRequestCubit>();

  @override
  void initState() {
    requestCubit.getAllRequestType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => requestCubit,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button and Title
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Requests Page',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // Question
                Text(
                  'How can I request a Request ?',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
                SizedBox(height: 12),
                BlocBuilder<StRequestCubit, StRequestState>(
                  builder: (context, state) {
                    if (state is StRequestLoadingState) {
                      return HandleState.loading();
                    } else if (state is StRequestErrorState) {
                      return HandleState.error(state.message, context);
                    } else {
                      return HandleState.emptyList(
                        child: _buildSuccess1(),
                        message: "Empty List Pending Requests",
                        paddingTop: 0,
                        list: requestCubit.requestTypes,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button and Title
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Requests Page',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Question
            Text(
              'How can I request a Request ?',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccess1() {
    var requests = requestCubit.requestTypes;
    return Expanded(
      child: ListView.builder(
        itemCount: requests.length, //requests.length,
        itemBuilder: (context, index) {
          final item = requests[index];
          return GestureDetector(
            onTap: () async {
              {
                var isRequest = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ConfirmRequest(
                          title: requests[index].name ?? '',
                          price: requests[index].price ?? "0",
                          id: requests[index].id ?? 0,
                        ),
                  ),
                );
                if (isRequest == true) {
                  requestCubit.getAllRequestType();
                }
              }
            },
            child: Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: Row(
                  children: [
                    Icon(Icons.event_note_outlined, size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.name ?? '',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Text(
                      '${item.price} EG',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RequestDetailsPage extends StatelessWidget {
  final String title;

  const RequestDetailsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.blue[700]),
      body: Center(
        child: Text('Details for "$title"', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
