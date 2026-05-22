import 'package:docolos/shared/data/repositories/mock_file_repository.dart';
import 'package:docolos/shared/domain/entities/doc_file.dart';
import 'package:docolos/shared/domain/repositories/file_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fileRepositoryProvider = Provider<FileRepository>((ref) {
  return MockFileRepository();
});

final recentFilesProvider = FutureProvider<List<DocFile>>((ref) {
  final repo = ref.watch(fileRepositoryProvider);
  return repo.getRecentFiles();
});
