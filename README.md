# LiteDocs (docolos)

LiteDocs adalah aplikasi Flutter Android yang fokus pada pembukaan dan pengelolaan dokumen secara cepat, ringan, dan offline-first.

Project ini sudah berisi pondasi MVP berdasarkan PRD di `doc/archirtecture.md`, termasuk struktur clean architecture awal, Riverpod state management, dan integrasi Android Open With.

## Fitur yang Sudah Ada

- Home screen dengan daftar recent files (mock data)
- Viewer screen scaffold untuk alur buka file
- Archive browser scaffold
- Theme light/dark
- Android intent filter untuk `ACTION_VIEW` (Open With)
- Intent stream handling via `receive_sharing_intent`

## Struktur Project (Saat Ini)

```text
lib/
  app.dart
  main.dart
  core/
    theme/
  features/
    archives/
    viewer/
  platform/
    intent/
  shared/
    data/
    domain/
    presentation/
```

## Tech Stack

- Flutter + Dart
- Riverpod (`flutter_riverpod`)
- File and intent integration:
  - `file_picker`
  - `path_provider`
  - `open_filex`
  - `receive_sharing_intent`
- Local storage foundation:
  - `isar`
  - `isar_flutter_libs`

## Menjalankan Project

```bash
flutter pub get
flutter run
```

## Quality Check

```bash
flutter analyze
flutter test
```

## Catatan Scope

Implementasi saat ini adalah baseline arsitektur MVP. Engine penuh untuk parsing/edit format (PDF, DOCX, XLSX, XML, ZIP/RAR/7z) masih tahap berikutnya.

## Roadmap Lanjutan

1. Ganti mock repository menjadi Isar persistence untuk recent/favorites.
2. Tambah handler URI/path error dan fallback UI untuk intent invalid.
3. Integrasi viewer nyata per format, dimulai dari PDF.
4. Tambah feature file management (rename, delete, share, duplicate).
