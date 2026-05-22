import 'package:docolos/shared/domain/entities/doc_file.dart';
import 'package:docolos/shared/domain/repositories/file_repository.dart';

class MockFileRepository implements FileRepository {
  final List<DocFile> _recent = [
    DocFile(
      path: '/storage/emulated/0/Download/report.pdf',
      name: 'report.pdf',
      type: DocFileType.pdf,
      lastOpened: DateTime.now().subtract(const Duration(minutes: 8)),
    ),
    DocFile(
      path: '/storage/emulated/0/Documents/budget.xlsx',
      name: 'budget.xlsx',
      type: DocFileType.spreadsheet,
      lastOpened: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];

  @override
  Future<void> addRecentFile(DocFile file) async {
    _recent.removeWhere((e) => e.path == file.path);
    _recent.insert(0, file);
  }

  @override
  Future<List<DocFile>> getFavoriteFiles() async {
    return _recent.where((e) => e.isFavorite).toList(growable: false);
  }

  @override
  Future<List<DocFile>> getRecentFiles() async {
    return List<DocFile>.unmodifiable(_recent);
  }
}
