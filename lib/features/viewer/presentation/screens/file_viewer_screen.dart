import 'package:docolos/shared/domain/entities/doc_file.dart';
import 'package:flutter/material.dart';

class FileViewerScreen extends StatelessWidget {
  const FileViewerScreen({super.key, required this.file});

  final DocFile file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('File path: ${file.path}'),
            const SizedBox(height: 12),
            const Text('Viewer module scaffold for PDF/DOCX/XLSX/XML/TXT.'),
          ],
        ),
      ),
    );
  }
}
