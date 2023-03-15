import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_notes/auth/note_auth.dart';
import 'package:smart_notes/components/note_card.dart';
import 'package:smart_notes/screens/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NoteAuth _noteAuth = NoteAuth();

  late String title;
  late String note;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/note');
        },
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: const Color.fromARGB(255, 97, 37, 200),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 97, 37, 200),
      ),
      drawer: const Drawer(
        child: DrawerScreen(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: _noteAuth.getNotes(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((document) {
                      return NoteCard(
                        note: document['note'],
                        title: document['title'],
                        deleteFunction: () async {},
                      );
                    }).toList(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
