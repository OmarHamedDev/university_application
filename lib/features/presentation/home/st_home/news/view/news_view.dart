
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';
import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../view_model/news_cubit.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  var cubit = getIt.get<NewsCubit>();

  @override
  initState() {
    cubit.getAllNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("News",style: TextStyle(
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
        backgroundColor: Colors.white,
        body: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetAllNewsLoadingState) {
              return HandleState.loading();
            } else if (state is GetAllNewsErrorState) {
              return HandleState.error(state.exception, context);
            } else {
              return HandleState.emptyList(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cubit.news.length,
                  itemBuilder: (context, index) {
                    final news = cubit.news[index];
                    return NewsCard(
                      title: news.title ?? "empty Title",
                      content: news.content ?? " empty content",
                      time: news.createdAt ?? "",
                      onDelete: () {
                        // showAwesomeDialog(
                        //   context,
                        //   title: "Delete News",
                        //   desc: "Do you want to delete this news?",
                        //   onOk: () {
                        //     cubit.deleteNews(id: news.id ?? 0);
                        //   },
                        //   onCancel: () {},
                        //   dialogType: DialogType.question,
                        // );
                      },
                    );
                  },
                ),
                list: cubit.news,
                paddingTop: 0,
              );
            }
          },
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String content;
  final String time;
  final VoidCallback onDelete;

  const NewsCard({
    super.key,
    required this.title,
    required this.content,
    required this.time,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<NewsCubit>();
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
                      cubit.formatISOTime(time),
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
