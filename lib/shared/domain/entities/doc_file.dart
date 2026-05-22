enum DocFileType { pdf, document, spreadsheet, xml, archive, text, unknown }

class DocFile {
  const DocFile({
    required this.path,
    required this.name,
    required this.type,
    required this.lastOpened,
    this.isFavorite = false,
  });

  final String path;
  final String name;
  final DocFileType type;
  final DateTime lastOpened;
  final bool isFavorite;
}
