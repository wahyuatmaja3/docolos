class IncomingIntentFile {
  const IncomingIntentFile({
    required this.path,
    required this.name,
    required this.mimeType,
  });

  final String path;
  final String name;
  final String? mimeType;
}
