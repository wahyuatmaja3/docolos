# Product Requirements Document (PRD)

## Project Name

**Docolos** – Lightweight Universal File Viewer & Editor for Android

---

# 1. Overview

Docolos is a super lightweight Android application built with Flutter that allows users to open, preview, edit, and manage common office and archive file formats directly from Android devices.

The app focuses on:

* Fast startup
* Minimal RAM usage
* Small APK size
* Offline functionality
* Smooth file opening experience
* Integration with Android “Open with” system

The application should automatically appear in Android’s **Open With / Share / File Handler** options when users open supported file types from file managers, browsers, messaging apps, or cloud storage providers.

---

# 2. Goals

## Primary Goals

* Open common document and archive files quickly
* Provide lightweight editing for supported formats
* Maintain low memory and battery usage
* Support Android file associations
* Work fully offline

## Secondary Goals

* Provide clean modern UI
* Allow quick file search and recent history
* Support dark mode
* Support large files efficiently

---

# 3. Target Users

## Primary Users

* Students
* Office workers
* Android users needing quick file access
* Low-end device users
* Users who dislike heavy office apps

## Device Targets

* Android 8.0+
* Low RAM devices (2GB RAM minimum)
* Mid-range and high-end devices

---

# 4. Supported File Formats

| Category | Extensions              | Features                     |
| -------- | ----------------------- | ---------------------------- |
| PDF      | `.pdf`                  | View, basic annotation       |
| Word     | `.docx`, `.doc`         | View, basic edit             |
| Excel    | `.xlsx`, `.xls`, `.csv` | View, basic spreadsheet edit |
| XML      | `.xml`                  | View, syntax highlight, edit |
| Archive  | `.zip`, `.rar`, `.7z`   | Browse, extract              |
| Text     | `.txt`, `.json`, `.md`  | View & edit                  |

---

# 5. Core Features

## 5.1 File Opening

### Features

* Open files from:

  * File manager
  * Downloads
  * WhatsApp/Telegram attachments
  * Browser downloads
  * Google Drive
  * External storage

### Requirements

* App appears in Android “Open With”
* Support Android Intent system
* Handle MIME types correctly

---

## 5.2 PDF Viewer

### Features

* Fast rendering
* Zoom in/out
* Page navigation
* Search text
* Dark mode reading
* Basic annotation:

  * Highlight
  * Draw
  * Notes

### Non-Goals

* Full professional PDF editing

---

## 5.3 Document Viewer & Editor

### DOCX / DOC

#### Features

* Read formatted text
* Edit text content
* Save changes
* Export back to DOCX

#### Limitations

* Complex formatting may not fully preserve

---

## 5.4 Spreadsheet Viewer & Editor

### XLSX / XLS / CSV

#### Features

* Open sheets
* Edit cells
* Add/remove rows
* Search table data
* Export/save

#### Non-Goals

* Advanced Excel formulas/macros

---

## 5.5 XML Viewer & Editor

### Features

* Syntax highlighting
* Collapse/expand nodes
* Search
* Pretty formatting
* Raw editing mode

---

## 5.6 Archive Manager

### ZIP / RAR / 7Z

#### Features

* Browse archive contents
* Extract files
* Preview files inside archives
* Password-protected archive support

#### Non-Goals

* Archive creation (initial release)

---

## 5.7 File Management

### Features

* Recent files
* Favorites
* File rename
* Duplicate
* Delete
* Share

---

## 5.8 Search

### Features

* Search local files
* Search recent documents
* Search inside supported documents

---

## 5.9 Offline Support

### Requirements

* No internet required
* All processing local
* No cloud dependency

---

# 6. Android Integration Requirements

## Open With Integration

The app must:

* Register supported MIME types
* Register file extensions
* Support Android file intents
* Become selectable as:

  * Default app
  * One-time open app

---

## Required Android Intent Filters

### Example Supported MIME Types

| File Type | MIME                                                                      |
| --------- | ------------------------------------------------------------------------- |
| PDF       | `application/pdf`                                                         |
| DOCX      | `application/vnd.openxmlformats-officedocument.wordprocessingml.document` |
| XLSX      | `application/vnd.openxmlformats-officedocument.spreadsheetml.sheet`       |
| CSV       | `text/csv`                                                                |
| ZIP       | `application/zip`                                                         |
| XML       | `text/xml`                                                                |

---

# 7. Performance Requirements

| Metric           | Target      |
| ---------------- | ----------- |
| Cold start       | < 2 seconds |
| APK size         | < 40 MB     |
| RAM usage        | < 250 MB    |
| File open time   | < 3 seconds |
| Smooth scrolling | 60 FPS      |

---

# 8. UI/UX Requirements

## Design Principles

* Minimalist
* Lightweight
* Fast navigation
* One-hand usability

---

## Main Screens

### Home

* Recent files
* Favorites
* Quick open

### File Viewer

* Toolbar
* Search
* Edit mode

### Archive Browser

* Folder-like navigation

### Settings

* Theme
* Default behaviors
* Cache management

---

# 9. Tech Stack

## Frontend

* Flutter
* Dart

---

## State Management

* Riverpod

---

## Local Database

* Hive or Isar

---

## File Handling

* path_provider
* file_picker
* open_filex

---

## PDF Rendering

* pdfx
* syncfusion_flutter_pdfviewer

---

## DOCX/XLSX Parsing

Possible libraries:

* archive
* excel
* docx_template
* xml

---

## Archive Support

* flutter_archive
* archive package
* 7zip native bridge

---

## Native Android Integration

### Kotlin Platform Channels

Used for:

* Android Intent handling
* MIME registration
* Open With integration
* Native archive handling

---

# 10. Architecture

## Recommended Architecture

Clean Architecture:

* Presentation Layer
* Domain Layer
* Data Layer

---

## Pattern

MVVM + Repository Pattern

---

# 11. Security Requirements

* No file upload to server
* No telemetry in offline mode
* Scoped storage compliance
* Secure temporary file cleanup

---

# 12. Accessibility

* Dark mode
* Dynamic font scaling
* Screen reader support
* High contrast mode

---

# 13. Future Features

## Phase 2

* Cloud integration
* OCR support
* Multi-tab editing
* Split screen

## Phase 3

* AI document summary
* Document translation
* Archive creation
* Advanced PDF editing

---

# 14. Risks

| Risk                     | Mitigation                   |
| ------------------------ | ---------------------------- |
| DOC compatibility issues | Limit editing scope          |
| Large PDF memory usage   | Lazy rendering               |
| RAR/7Z native dependency | Use platform-specific bridge |
| APK becoming too large   | Modular feature loading      |

---

# 15. MVP Scope

## Included in MVP

* Open supported file formats
* Basic editing
* Archive extraction
* Open With support
* Recent files
* Dark mode

## Excluded from MVP

* Cloud sync
* OCR
* AI features
* Collaboration
* Advanced office editing

---

# 16. Success Metrics

| Metric                 | Target  |
| ---------------------- | ------- |
| Crash-free sessions    | > 99%   |
| App size               | < 40 MB |
| Average rating         | > 4.5   |
| File open success rate | > 95%   |

---

# 17. Suggested Package Structure

```text
/lib
  /core
  /features
    /pdf
    /documents
    /spreadsheets
    /archives
    /xml
  /shared
  /services
  /platform
```

---

# 18. Recommended Flutter Plugins

| Purpose            | Plugin                   |
| ------------------ | ------------------------ |
| File picker        | `file_picker`            |
| Open with support  | `receive_sharing_intent` |
| PDF viewer         | `pdfx`                   |
| Spreadsheet        | `excel`                  |
| XML parser         | `xml`                    |
| Local storage      | `isar`                   |
| State management   | `flutter_riverpod`       |
| Archive extraction | `flutter_archive`        |

---

# 19. Android Manifest Requirements

The app must include:

* Intent filters for supported extensions
* MIME type associations
* Storage permissions
* SAF (Storage Access Framework) support

Example:

* `ACTION_VIEW`
* `CATEGORY_DEFAULT`
* `CATEGORY_BROWSABLE`

---

# 20. Conclusion

Docolos aims to become a fast, lightweight, offline-first universal document and archive viewer/editor for Android devices. The application prioritizes speed, low resource usage, and deep Android file integration while supporting the most commonly used office and archive file formats.
