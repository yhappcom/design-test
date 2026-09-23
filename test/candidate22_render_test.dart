import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/home_candidate_22_flight_manifest.dart';

Future<ByteData> fontData(String path) async {
  final bytes = await File(path).readAsBytes();
  return ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.lengthInBytes);
}

Future<void> loadRenderFonts() async {
  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot == null) {
    throw StateError('FLUTTER_ROOT is required for deterministic icon rendering');
  }

  final sans = FontLoader('CandidateRenderFont')
    ..addFont(fontData('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'));
  final mono = FontLoader('monospace')
    ..addFont(fontData('/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf'));
  final icons = FontLoader('MaterialIcons')
    ..addFont(fontData(
      '$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
    ));

  await Future.wait([sans.load(), mono.load(), icons.load()]);
}

void main() {
  setUpAll(loadRenderFonts);

  Future<void> shot(
    WidgetTester tester,
    Brightness brightness,
    String name,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    final theme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      fontFamily: 'CandidateRenderFont',
    );

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: theme,
        themeMode:
            brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
        home: RepaintBoundary(
          key: const Key('shot'),
          child: const SizedBox(
            width: 390,
            height: 844,
            child: Scaffold(body: HomeCandidate22FlightManifest()),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    await expectLater(
      find.byKey(const Key('shot')),
      matchesGoldenFile('goldens/candidate22_${name}_390x844.png'),
    );
  }

  testWidgets(
    'light 390x844',
    (tester) async => shot(tester, Brightness.light, 'light'),
  );
  testWidgets(
    'dark 390x844',
    (tester) async => shot(tester, Brightness.dark, 'dark'),
  );
}
