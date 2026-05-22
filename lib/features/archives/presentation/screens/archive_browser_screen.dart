import 'package:flutter/material.dart';

class ArchiveBrowserScreen extends StatelessWidget {
  const ArchiveBrowserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Archive Browser')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.folder_zip_outlined),
            title: Text('documents.zip'),
            subtitle: Text('Tap to browse and extract'),
          ),
          ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text('secure.7z'),
            subtitle: Text('Password-protected archive placeholder'),
          ),
        ],
      ),
    );
  }
}
