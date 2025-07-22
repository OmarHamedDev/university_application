import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';

import '../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../view_model/admin_news_cubit.dart';
import 'add_new_news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var cubit = getIt.get<AdminNewsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getAllNews(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AdminNewsCubit, AdminNewsState>(
          listener: (context, state) {
            if (state is DeleteAdminNewsErrorState) {
              showAwesomeDialog(
                context,
                title: " Error",
                desc: "Do you want to delete this news?",
                onOk: () {
                  //cubit.deleteNews(id: news.id ?? 0);
                },

                dialogType: DialogType.warning,
              );
            }
          },
          builder: (context, state) {
            if (state is GetAllAdminNewsLoadingState) {
              return HandleState.loading();
            } else if (state is GetAllAdminNewsErrorState) {
              return HandleState.error(state.exception, context);
            } else {
              return HandleState.emptyList(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cubit.newsList.length,
                  itemBuilder: (context, index) {
                    final news = cubit.newsList[index];
                    return InkWell(
                      onTap: () {
                        cubit.getAllNews();
                      },
                      child: NewsCard(
                        title: news.title ?? "empty Title",
                        content: news.content ?? " empty content",
                        time: news.createdAt ?? "",
                        onDelete: () {
                          showAwesomeDialog(
                            context,
                            title: "Delete News",
                            desc: "Do you want to delete this news?",
                            onOk: () {
                              cubit.deleteNews(id: news.id ?? 0);
                            },
                            onCancel: () {},
                            dialogType: DialogType.question,
                          );
                        },
                      ),
                    );
                  },
                ),
                list: cubit.newsList,
                paddingTop: 0,
              );
            }
          },
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.blue,
            onPressed: () async {
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewNewsAdmin(),
                ),
              );
              if (result == true) {
                cubit.getAllNews();
              }
              //    context.read<AdminNewsCubit>().getAllNews();
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
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
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onDelete,
              child: const Icon(Icons.close, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
