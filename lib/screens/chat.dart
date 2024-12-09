import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:projetos/database/database.dart';
import 'package:projetos/models/usuario.dart';

class ChatArguments {
  Usuario usuario;
  String cpfInterlocutor;
  String nomeInterlocutor;

  ChatArguments({
    required this.usuario,
    required this.cpfInterlocutor,
    required this.nomeInterlocutor
  });
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: ChatPage(),
        ),
      );
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Usuario usuario;
  late String cpfInterlocutor;
  List<types.Message> _messages = [];
  int _incrementalId = 1;

  types.User _user = types.User(id: '');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _loadMessages());
  }

  void _addMessage(types.Message message) {
    print(message.createdAt.toString());
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: '${++_incrementalId}',
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    _user = types.User(id: usuario.cpf);

    final messages = await DatabaseService().getMessagesFromChat(usuario?.cpf, cpfInterlocutor);
    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    ChatArguments chatArguments = ModalRoute.of(context)?.settings.arguments as ChatArguments;
    usuario = chatArguments.usuario;
    cpfInterlocutor = chatArguments.cpfInterlocutor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 23, 93, 95),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Chat(
        messages: _messages,
        onAttachmentPressed: _handleAttachmentPressed,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: _user,
        theme: DefaultChatTheme(
          backgroundColor: Color.fromARGB(255, 23, 93, 95),
          primaryColor: Color.fromRGBO(29, 28, 33, 1),
        ),
      ),
    );
  }
}