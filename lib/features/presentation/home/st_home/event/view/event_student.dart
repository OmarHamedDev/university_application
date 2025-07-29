import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/event/view_model/event_cubit.dart';
import '../../../../../../../core/utils/constants/App_colors.dart';
import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../../../../../core/widgets/cached_network_image_widget.dart';

class EventStudent extends StatefulWidget {
  const EventStudent({super.key});

  @override
  State<EventStudent> createState() => _EventStudent();
}

class _EventStudent extends State<EventStudent> {
  var eventCubit =    getIt.get<EventCubit>();
  @override
  initState() {
    super.initState();
    eventCubit.getAllEvents();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventCubit>(
      create:(context) =>  eventCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Events",style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/hti_logo.png',
                ), // شعار المعهد
              ),
            ),

          ],
        ),
        backgroundColor: AppColors.secondary,
        body: BlocBuilder<EventCubit, EventState>(
          builder: (context, state) {
            if (state is StEventsLoadingState) {
              return HandleState.loading();
            } else if (state is StEventsErrorState) {
              return HandleState.error(state.exception, context);
            } else {
              return HandleState.emptyList(
                list: eventCubit.events,
                message: "Empty List Events",
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: eventCubit.events.length,
                  itemBuilder: (context, index) {
                    return EventCard(event: eventCubit.events[index]);
                  },
                ),
              );
            }
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
    var eventCubit = context.read<EventCubit>();
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
          // Positioned(
          //   top: 10,
          //   right: 10,
          //   child: CircleAvatar(
          //     radius: 12,
          //     backgroundColor: Colors.red,
          //     child: InkWell(
          //         onTap: () {
          //           showAwesomeDialog(
          //             context,
          //             title: "Delete Event",
          //             desc: "Do you want to delete this event?",
          //             onOk: () {
          //               eventCubit.deleteEvent(id: event.id ?? 0);
          //             },
          //             onCancel: () {},
          //             dialogType: DialogType.question,
          //           );
          //         },
          //         child: const Icon(Icons.close, size: 16, color: Colors.white)),
          //   ),
          // ),
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
