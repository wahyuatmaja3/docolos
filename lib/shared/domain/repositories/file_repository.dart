import 'package:docolos/shared/domain/entities/doc_file.dart';

abstract class FileRepository {
  Future<List<DocFile>> getRecentFiles();
  Future<List<DocFile>> getFavoriteFiles();
  Future<void> addRecentFile(DocFile file);
}
