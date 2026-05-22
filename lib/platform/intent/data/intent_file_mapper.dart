import 'package:docolos/platform/intent/domain/entities/incoming_intent_file.dart';
import 'package:docolos/shared/domain/entities/doc_file.dart';

class IntentFileMapper {
  static DocFile toDocFile(IncomingIntentFile incoming) {
    return DocFile(
      path: incoming.path,
      name: incoming.name,
      type: _resolveType(incoming.name, incoming.mimeType),
      lastOpened: DateTime.now(),
    );
  }

  static DocFileType _resolveType(String name, String? mimeType) {
    final lowerName = name.toLowerCase();
    final lowerMime = (mimeType ?? '').toLowerCase();

    if (lowerName.endsWith('.pdf') || lowerMime == 'application/pdf') {
      return DocFileType.pdf;
    }
    if (lowerName.endsWith('.doc') || lowerName.endsWith('.docx') || lowerMime.contains('word')) {
      return DocFileType.document;
    }
    if (lowerName.endsWith('.xls') ||
        lowerName.endsWith('.xlsx') ||
        lowerName.endsWith('.csv') ||
        lowerMime.contains('excel') ||
        lowerMime == 'text/csv') {
      return DocFileType.spreadsheet;
    }
    if (lowerName.endsWith('.xml') || lowerMime.contains('xml')) {
      return DocFileType.xml;
    }
    if (lowerName.endsWith('.zip') ||
        lowerName.endsWith('.rar') ||
        lowerName.endsWith('.7z') ||
        lowerMime.contains('zip') ||
        lowerMime.contains('rar') ||
        lowerMime.contains('7z')) {
      return DocFileType.archive;
    }
    if (lowerName.endsWith('.txt') || lowerName.endsWith('.json') || lowerName.endsWith('.md')) {
      return DocFileType.text;
    }
    return DocFileType.unknown;
  }
}
