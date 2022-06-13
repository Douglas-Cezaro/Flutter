import 'dart:io';
import 'package:chat/chat_message.dart';
import 'package:chat/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scallfoldKey = GlobalKey<ScaffoldState>();

  User? _currentUser;
  bool _isLoading = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  Future<User?> _getUser() async {
    if (_currentUser != null) {
      return _currentUser;
    } else {
      try {
        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;
          final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken,
          );
          final UserCredential authResult =
              await FirebaseAuth.instance.signInWithCredential(credential);
          final User user = authResult.user!;
          return user;
        }
      } catch (error) {
        return null;
      }
    }
  }

  void _sendMessage({String? text, File? imgFile}) async {
    final User? user = await _getUser();

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Não foi possivel fazer o login. Tente novamente!"),
            backgroundColor: Colors.red),
      );
    } else {
      Map<String, dynamic> data = {
        "uid": user.uid,
        "senderName": user.displayName,
        "senderPhotoUrl": user.photoURL,
        "time": Timestamp.now(),
      };
      if (imgFile != null) {
        setState(() {
          _isLoading = true;
        });
        UploadTask task = FirebaseStorage.instance
            .ref()
            .child(user.uid + DateTime.now().millisecondsSinceEpoch.toString())
            .putFile(imgFile);

        TaskSnapshot taskSnapshot = await task;
        String url = await taskSnapshot.ref.getDownloadURL();
        data['imgUrl'] = url;
        setState(() {
          _isLoading = false;
        });
      }
      if (text != null) {
        data['text'] = text;
      }
      FirebaseFirestore.instance.collection('messages').add(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scallfoldKey,
      appBar: AppBar(
        title: Text(_currentUser != null
            ? 'Olá ${_currentUser?.displayName}'
            : 'Chat App'),
        elevation: 0,
        centerTitle: true,
        actions: [
          _currentUser != null
              ? IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    googleSignIn.signOut();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Você saiu com sucesso!"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.exit_to_app),
                )
              : Container()
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("messages")
                .orderBy("time")
                .snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.data == null || !snapshot.hasData) {
                    return const Center(
                      child: Text("Nenhuma mensagem até o momento"),
                    );
                  } else {
                    List<DocumentSnapshot> documents =
                        snapshot.data!.docs.reversed.toList();
                    return ListView.builder(
                      itemCount: documents.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        final data =
                            documents[index].data() as Map<String, dynamic>;

                        return ChatMessage(
                          data: data,
                          mine: data['uid'] == _currentUser?.uid,
                        );
                      },
                    );
                  }
              }
            },
          )),
          _isLoading ? const LinearProgressIndicator() : Container(),
          TextComposer(_sendMessage),
        ],
      ),
    );
  }
}
