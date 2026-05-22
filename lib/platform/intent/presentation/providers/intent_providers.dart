import 'dart:async';

import 'package:docolos/platform/intent/data/intent_file_mapper.dart';
import 'package:docolos/platform/intent/domain/entities/incoming_intent_file.dart';
import 'package:docolos/shared/domain/entities/doc_file.dart';
import 'package:docolos/shared/presentation/providers/file_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

final incomingDocFileStreamProvider = StreamProvider<DocFile>((ref) async* {
  final repo = ref.read(fileRepositoryProvider);

  final initial = await ReceiveSharingIntent.instance.getInitialMedia();
  if (initial.isNotEmpty) {
    final media = initial.first;
    final incoming = IncomingIntentFile(
      path: media.path,
      name: media.path.split('/').last,
      mimeType: media.type.name,
    );
    final file = IntentFileMapper.toDocFile(incoming);
    await repo.addRecentFile(file);
    yield file;
    ReceiveSharingIntent.instance.reset();
  }

  final controller = StreamController<DocFile>();
  final sub = ReceiveSharingIntent.instance.getMediaStream().listen((items) async {
    if (items.isEmpty) {
      return;
    }
    final media = items.first;
    final incoming = IncomingIntentFile(
      path: media.path,
      name: media.path.split('/').last,
      mimeType: media.type.name,
    );
    final file = IntentFileMapper.toDocFile(incoming);
    await repo.addRecentFile(file);
    controller.add(file);
  });

  ref.onDispose(() async {
    await sub.cancel();
    await controller.close();
  });

  yield* controller.stream;
});
