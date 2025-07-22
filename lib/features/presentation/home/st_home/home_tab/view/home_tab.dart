import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/utils/functions/handle_state/handle_state.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';

import '../../../../../domain/entities/event_entity.dart';
import '../../../../../domain/entities/news_entity.dart';
import '../view_model/st_home_tab_cubit.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var homeTabCubit = getIt.get<StHomeTabCubit>();
  @override
  void initState() {
    Future.wait({homeTabCubit.getAllEvents(), homeTabCubit.getAllNews()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeTabCubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<StHomeTabCubit, StHomeTabState>(
          builder: (context, state) {
            return _handleBlocBuilder(homeTabCubit, state);
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(actionText, style: const TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildEventCard(EventEntity event, StHomeTabCubit cubit) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
        image: DecorationImage(
          image: AssetImage('assets/images/Frame 1268 (1).png'), // صورة المبنى
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  event.content,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Spacer(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/images/hti_logo.png'),
                    ),
                    Spacer(),
                    Text(
                      cubit.formatISOTime(event.createdAt),
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(NewsEntity news, StHomeTabCubit cubit) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(news.title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(
                  news.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      cubit.formatISOTime(news.createdAt),
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    //                    Text("25/5/2025", style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/hti_logo.png'),
          ),
        ],
      ),
    );
  }

  Widget _handleBlocBuilder(StHomeTabCubit cubit, StHomeTabState state) {
    if (state is StHomeTbEventsLoading || state is StHomeTabNewsLoading) {
      return HandleState.loading();
    }
    if (state is StHomeTabEventsErrorState) {
      return HandleState.error(state.exception, context);
    }
    if (state is StHomeTabNewsErrorState) {
      return HandleState.error(state.exception, context);
    }
    if (cubit.events.isEmpty && cubit.news.isEmpty) {
      return HandleState.emptyList(child: Text("Empty List"), list: []);
    }

    return _buildBodySuccessWidget(cubit);
  }

  Widget _buildBodySuccessWidget(StHomeTabCubit cubit) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Higher Technological Institute',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      text: 'Department : ',
                      style: TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: 'Computer Science',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/hti_logo.png',
                ), // شعار المعهد
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Events Section
          _buildSectionHeader('Events', ''),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.events.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder:
                  (_, index) => _buildEventCard(cubit.events[index], cubit),
            ),
          ),
          const SizedBox(height: 20),

          // News Section
          _buildSectionHeader('News:', ''),
          const SizedBox(height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cubit.news.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, index) => _buildNewsCard(cubit.news[index], cubit),
          ),
        ],
      ),
    );
  }
}
