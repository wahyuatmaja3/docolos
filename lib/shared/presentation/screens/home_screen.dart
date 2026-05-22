import 'package:docolos/features/archives/presentation/screens/archive_browser_screen.dart';
import 'package:docolos/features/viewer/presentation/screens/file_viewer_screen.dart';
import 'package:docolos/platform/intent/presentation/providers/intent_providers.dart';
import 'package:docolos/shared/domain/entities/doc_file.dart';
import 'package:docolos/shared/presentation/providers/file_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(incomingDocFileStreamProvider, (previous, next) {
      next.whenData((file) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => FileViewerScreen(file: file)),
        );
      });
    });

    final recentAsync = ref.watch(recentFilesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Docolos'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.folder_open),
        label: const Text('Quick Open'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Recent Files', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          recentAsync.when(
            data: (files) => Column(
              children: files
                  .map(
                    (file) => Card(
                      child: ListTile(
                        title: Text(file.name),
                        subtitle: Text(file.path),
                        leading: Icon(_iconFor(file.type)),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => FileViewerScreen(file: file)),
                          );
                        },
                      ),
                    ),
                  )
                  .toList(growable: false),
            ),
            error: (error, _) => Text('Error: $error'),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.archive_outlined),
              title: const Text('Open Archive Browser'),
              subtitle: const Text('Browse ZIP, RAR, and 7Z files'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ArchiveBrowserScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconFor(DocFileType type) {
    switch (type) {
      case DocFileType.pdf:
        return Icons.picture_as_pdf_outlined;
      case DocFileType.document:
        return Icons.description_outlined;
      case DocFileType.spreadsheet:
        return Icons.table_chart_outlined;
      case DocFileType.xml:
        return Icons.code_outlined;
      case DocFileType.archive:
        return Icons.archive_outlined;
      case DocFileType.text:
        return Icons.text_snippet_outlined;
      case DocFileType.unknown:
        return Icons.insert_drive_file_outlined;
    }
  }
}
