import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/features/home/std_home_tabs/notification/cuibt/notification_cubit.dart';
import '../../../../core/utils/constants/App_colors.dart';

class NotificationTab extends StatelessWidget {
  static const String routeName = 'notifi';

  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {

        return Scaffold(
          backgroundColor: AppColors.secondary,
          body:state is NotificationLoading?Center(
            child: CircularProgressIndicator(),
        ):
          NotificationCubit.get(context,).notificationModel!.notifications!.isEmpty
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/carbon_notification-filled.png",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "No Notification yet",
                style: TextStyle(fontSize: 22),
              ),
            ],
          )
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                            itemBuilder: (context, index) {
                final data=NotificationCubit.get(context).notificationModel!.notifications?[index];
                return NotificationCard(title: data?.title??"",
                    content: data?.message??"",
                    time: NotificationCubit.get(context).formatISOTime(data?.createdAt??""),
                   );
                            },
                            itemCount: NotificationCubit
                  .get(context)
                  .notificationModel!
                  .notifications!
                  .length,
                          ),
              ),
        );
      },
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String content;
  final String time;

  const NotificationCard({
    super.key,
    required this.title,
    required this.content,
    required this.time,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(content, style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: GestureDetector(
          //     onTap: onDelete,
          //     child: const Icon(Icons.close, color: Colors.red),
          //   ),
          // ),
        ],
      ),
    );
  }
}
