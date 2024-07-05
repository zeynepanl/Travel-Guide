import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;
  List<DocumentSnapshot> notes = [];

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    if (user != null) {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user!.uid)
          .collection('notes')
          .get();

      setState(() {
        notes = snapshot.docs;
      });
    }
  }

  Future<void> _addNote() async {
    String newNote = await _showNoteDialog();
    if (newNote.isNotEmpty) {
      await _firestore.collection('users').doc(user!.uid).collection('notes').add({'content': newNote});
      fetchNotes();
    }
  }

  Future<void> _editNoteDialog(DocumentSnapshot note) async {
    String editedNote = await _showNoteDialog(content: note['content']);
    if (editedNote.isNotEmpty) {
      await _firestore.collection('users').doc(user!.uid).collection('notes').doc(note.id).update({'content': editedNote});
      fetchNotes();
    }
  }

  Future<void> _deleteNoteDialog(DocumentSnapshot note) async {
    await _firestore.collection('users').doc(user!.uid).collection('notes').doc(note.id).delete();
    fetchNotes();
  }

  Future<String> _showNoteDialog({String content = ''}) async {
    TextEditingController noteController = TextEditingController(text: content);
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(content.isEmpty ? 'Yeni Not Ekle' : 'Notu Düzenle'),
          content: TextField(
            controller: noteController,
            decoration: InputDecoration(
              hintText: 'Notunuzu buraya yazın',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(''),
              child: Text('İptal'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(noteController.text),
              child: Text('Kaydet'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notlarım', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: notes.isEmpty
            ? Center(child: Text('Henüz not eklenmemiş.'))
            : ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            DocumentSnapshot note = notes[index];
            return Card(
              child: ListTile(
                title: Text(note['content']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editNoteDialog(note),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteNoteDialog(note),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
    );
  }
}
