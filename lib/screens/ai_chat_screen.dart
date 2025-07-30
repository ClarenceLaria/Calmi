import 'package:calmi_app/core/models/chat_message.dart';
import 'package:calmi_app/core/repositories/data.dart';
import 'package:calmi_app/features/chat/chat_search_bar.dart';
import 'package:calmi_app/features/chat/message_widget.dart';
import 'package:calmi_app/providers/chat_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiChat extends StatefulWidget {
  const AiChat({super.key});

  @override
  State<AiChat> createState() => _AiChatState();
}

class _AiChatState extends State<AiChat> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final FocusNode _focusNode = FocusNode();

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: text, isUser: true));
      });
      _messageController.clear();

      // Simulated AI response (optional)
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _messages.add(ChatMessage(text: "🤖: I received your message: \"$text\"", isUser: false));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Consumer<ChatSearchProvider>(
          builder: (context, provider, _){
            return provider.isSearching
                ? ChatSearchBar(label: 'Search...', isExpanded: true, onToggle: provider.toggleSearchBar)
                : const Text(
                    'Chat with Mindy',
                    style: TextStyle(color: Colors.black),
                  );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100, MediaQuery.of(context).size.height * 0.1, 0, 100),
                items: [
                  PopupMenuItem(
                    child: Column(
                      children: chatDropDownItems.map((item) {
                        return ListTile(
                          leading: Image.asset(item['icon'], width: 16, height: 16, color: item['color']),
                          title: Text(
                            item['title'],
                            style: TextStyle(
                              fontSize: 12,
                              color: item['color'],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => item['function'](context),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
            icon: const Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index){
                final message = _messages[index];
                return MessageWidget(message: message);
              }
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 0.5),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      focusNode: _focusNode,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 40,
                    width: 40,
                    child: IconButton(
                      onPressed: _sendMessage,
                      icon: Image.asset(
                        'assets/icons/send.png',
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}