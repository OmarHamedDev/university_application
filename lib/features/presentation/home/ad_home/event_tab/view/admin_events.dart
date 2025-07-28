import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';
import '../../../../../../../core/utils/constants/App_colors.dart';

import '../../../../../../core/utils/constants/App_colors.dart';
import '../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../../../../../core/widgets/cached_network_image_widget.dart';
import 'add_new_events.dart';
import '../view_model/admin_event_cubit/admin_event_cubit.dart';

class AdminEvents extends StatefulWidget {
  const AdminEvents({super.key});

  @override
  State<AdminEvents> createState() => _AdminEventsState();
}

class _AdminEventsState extends State<AdminEvents> {
  var eventCubit = getIt.get<AdminEventCubit>();
  @override
  initState() {
    super.initState();
    eventCubit.getAllEvents();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: eventCubit,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.blue,
            onPressed: () async {
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewEvents(),
                ),
              );
              if (result == true) {
                eventCubit.getAllEvents();
              }
              //    context.read<AdminNewsCubit>().getAllNews();
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),

        backgroundColor: AppColors.secondary,
        body: BlocConsumer<AdminEventCubit, AdminEventState>(
          listener: (context, state) {
            if (state is DeleteAdminEventErrorState) {
              showAwesomeDialog(
                context,
                title: " Error",
                desc: "Do you want to delete this event?",
                onOk: () {
                  //cubit.deleteNews(id: news.id ?? 0);
                },

                dialogType: DialogType.warning,
              );
            }
          },
          builder: (context, state) {
            if (state is GetAllAdminEventLoadingState) {
              return HandleState.loading();
            } else if (state is GetAllAdminEventErrorState) {
              return HandleState.error(state.exception, context);
            } else {
              return HandleState.emptyList(
                list: eventCubit.eventsList,
                message: "Empty List Events",
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  itemCount: eventCubit.eventsList.length,
                  itemBuilder: (context, index) {
                    return EventCard(event: eventCubit.eventsList[index]);
                  },
                ),
              );
            }
            // return Column(
            //   children: [
            //     // Padding(
            //     //   padding: const EdgeInsets.symmetric(
            //     //       vertical: 8.0, horizontal: 16),
            //     //   child: SizedBox(
            //     //     width: double.infinity,
            //     //     child: ElevatedButton(
            //     //       onPressed: () {
            //     //         Navigator.push(context, MaterialPageRoute(
            //     //             builder: (context) => AddNewEvents()));
            //     //       },
            //     //       style: ElevatedButton.styleFrom(
            //     //         backgroundColor: Colors.white,
            //     //         side: const BorderSide(color: Colors.blue),
            //     //         shape: RoundedRectangleBorder(
            //     //           borderRadius: BorderRadius.circular(12),
            //     //         ),
            //     //       ),
            //     //       child: const Text(
            //     //         'Add new events',
            //     //         style: TextStyle(color: Colors.blue),
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ),
            //     Expanded(
            //       child: ListView.builder(
            //         padding: const EdgeInsets.symmetric(horizontal: 12),
            //         itemCount: 5, // عدد العناصر التجريبية
            //         itemBuilder: (context, index) {
            //           return EventCard();
            //         },
            //       ),
            //     ),
            //   ],
            // );
          },
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final EventEntity event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var eventCubit = context.read<AdminEventCubit>();
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
         CachedNetworkImageWidget(
            imageUrl: event.image,
            height: 200,
            width: double.infinity,
           // fit: BoxFit.cover,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.red,
              child: InkWell(
                  onTap: () {
                    showAwesomeDialog(
                      context,
                      title: "Delete Event",
                      desc: "Do you want to delete this event?",
                      onOk: () {
                        eventCubit.deleteEvent(id: event.id ?? 0);
                      },
                      onCancel: () {},
                      dialogType: DialogType.question,
                    );
                  },
                  child: const Icon(Icons.close, size: 16, color: Colors.white)),
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            child: Text(
              event.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 16,
            child: Text(
              event.content,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 16,
            child: Row(
              children: [
                Image.asset('assets/images/hti_logo.png', height: 30),
                const SizedBox(width: 10),
                Text(
                  eventCubit.formatISOTime(event.createdAt),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
