import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocConsumer, BlocProvider, ReadContext;

import '../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../../../dependency_inversion/di.dart';
import '../../../presentation/home/st_home/menua/chat/view/chat_cubit.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final Set<int> answeredIds = {};
  final Set<int> loadingIds = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ChatCubit>()..getAllQuestions(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Chatbot", style: TextStyle(color: Colors.blue)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
        ),
        body: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is AnswerQuestionSuccessState) {
              setState(() {
                loadingIds.removeWhere(
                  (id) => context.read<ChatCubit>().chats.any(
                    (chat) => chat.id == id && chat.answer?.isNotEmpty == true,
                  ),
                );
                answeredIds.addAll(
                  context
                      .read<ChatCubit>()
                      .chats
                      .where((chat) => chat.answer?.isNotEmpty ?? false)
                      .map((chat) => chat.id!)
                      .toList(),
                );
              });
            } else if (state is AnswerQuestionErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.exception.toString()}')),
              );
              setState(() {
                loadingIds.clear();
              });
            }
          },
          builder: (context, state) {
            if (state is GetAllQuestionsLoadingState) {
              return HandleState.loading();
            } else if (state is GetAllQuestionsErrorState) {
              return HandleState.error(state.exception, context);
            } else {
              final chats = context.read<ChatCubit>().chats;

              return HandleState.emptyList(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    final isAnswered = answeredIds.contains(chat.id);
                    final isLoading = loadingIds.contains(chat.id);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 16,
                              ),
                            ),
                            onPressed: () async {
                              if (chat.id != null &&
                                  !isAnswered &&
                                  !isLoading) {
                                setState(() {
                                  loadingIds.add(chat.id!);
                                });
                                await context.read<ChatCubit>().answerQuestions(
                                  chat.id!.toString(),
                                );
                              }
                            },
                            child:
                                isLoading
                                    ? const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                    : Text(
                                      chat.question ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                          ),
                        ),
                        if (isAnswered && (chat.answer?.isNotEmpty ?? false))
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(top: 8, bottom: 16),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                chat.answer ?? '',
                                style: const TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                list: chats,
              );
            }
          },
        ),
      ),
    );
  }
}
