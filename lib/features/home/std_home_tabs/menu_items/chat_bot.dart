import 'package:flutter/material.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    // رسائل وهمية
    final List<Map<String, dynamic>> messages = [
      {"text": "Hello chat, how are you today?", "isUser": true},
      {"text": "Hello, I'm fine, how can I help you?", "isUser": false},
      {"text": "What is the best programming language?", "isUser": true},
      {
        "text":
        "There are many programming languages in the market that are used in designing and building websites, various applications and other tasks. All these languages are popular in their place and in the way they are used, and many programmers learn and use them.",
        "isUser": false
      },
      {"text": "So explain to me more", "isUser": true},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Chatbot", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg['isUser']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: msg['isUser']
                          ? Colors.blue
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      msg['text'],
                      style: TextStyle(
                        color: msg['isUser'] ? Colors.white : Colors.black87,
                        fontSize: 14.5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                    InputDecoration(
                      hintText: 'Write your message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.mic_none, color: Colors.grey),
                  onPressed: () {},
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
