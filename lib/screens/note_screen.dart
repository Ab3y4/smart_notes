import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_notes/auth/note_auth.dart';
import 'package:smart_notes/components/text_input_field.dart';
import 'package:smart_notes/spacers/h20_sized_box.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final NoteAuth _noteAuth = NoteAuth();
  late String title;
  late String note;
  final String _uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Note'),
        backgroundColor: const Color.fromARGB(255, 97, 37, 200),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () async {
                  _noteAuth.addNote(title, note, _uid, context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextInputField(
              obscr: false,
              hintText: 'Title',
              onChange: (value) {
                title = value;
              },
            ),
          ),
          const H20SizedBox(),
          TextInputField(
            obscr: false,
            hintText: 'Type Your Note in Here......',
            onChange: (value) {
              note = value;
            },
          ),
          const H20SizedBox(),
        ],
      ),
    );
  }
}
