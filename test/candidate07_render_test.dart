import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logmate_visual_preview/home_candidate_07_visual.dart';

const _reviewFontFamily = 'PreviewSans';

Future<void> _loadReviewFont() async {
  final candidates = [
    [
      '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf',
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ],
    [
      '/usr/share/fonts/truetype/liberation2/LiberationSans-Regular.ttf',
      '/usr/share/fonts/truetype/liberation2/LiberationSans-Bold.ttf',
    ],
  ];
  final files = candidates.firstWhere(
    (candidate) => candidate.every((path) => File(path).existsSync()),
    orElse: () => throw StateError('No complete review sans family found.'),
  );
  final loader = FontLoader(_reviewFontFamily);
  for (final path in files) {
    final bytes = await File(path).readAsBytes();
    loader.addFont(Future<ByteData>.value(ByteData.sublistView(Uint8List.fromList(bytes))));
  }
  await loader.load();

  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot != null) {
    final iconFile = File('$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf');
    if (iconFile.existsSync()) {
      final bytes = await iconFile.readAsBytes();
      final iconLoader = FontLoader('MaterialIcons')
        ..addFont(Future<ByteData>.value(ByteData.sublistView(Uint8List.fromList(bytes))));
      await iconLoader.load();
    }
  }
}

Future<void> _golden(WidgetTester tester, Brightness brightness, String fileName) async {
  await tester.binding.setSurfaceSize(const Size(390, 844));
  addTearDown(() => tester.binding.setSurfaceSize(null));

  await tester.pumpWidget(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.light, fontFamily: _reviewFontFamily),
    darkTheme: ThemeData(brightness: Brightness.dark, fontFamily: _reviewFontFamily),
    themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
    home: const HomeCandidate07Visual(),
  ));
  await tester.pumpAndSettle();

  await expectLater(
    find.byType(Scaffold).first,
    matchesGoldenFile('goldens/$fileName'),
  );
}

void main() {
  setUpAll(_loadReviewFont);

  testWidgets('Candidate 07 light 390x844', (tester) async {
    await _golden(tester, Brightness.light, 'candidate07_light_390x844.png');
  });

  testWidgets('Candidate 07 dark 390x844', (tester) async {
    await _golden(tester, Brightness.dark, 'candidate07_dark_390x844.png');
  });
}
