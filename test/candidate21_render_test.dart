import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/home_candidate_21_renderable.dart';

Future<void> loadRenderFont() async {
  final bytes = await File('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf').readAsBytes();
  final data = ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.lengthInBytes);
  final loader = FontLoader('CandidateRenderFont')..addFont(Future<ByteData>.value(data));
  await loader.load();
}

void main() {
  setUpAll(loadRenderFont);

  Future<void> shot(WidgetTester t, Brightness b, String name) async {
    await t.binding.setSurfaceSize(const Size(390, 844));
    final theme = ThemeData(
      brightness: b,
      useMaterial3: true,
      fontFamily: 'CandidateRenderFont',
    );
    await t.pumpWidget(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: theme,
      themeMode: b == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      home: RepaintBoundary(
        key: const Key('shot'),
        child: const SizedBox(
          width: 390,
          height: 844,
          child: Scaffold(body: HomeCandidate21Renderable()),
        ),
      ),
    ));
    await t.pumpAndSettle();
    await expectLater(
      find.byKey(const Key('shot')),
      matchesGoldenFile('goldens/candidate21_${name}_390x844.png'),
    );
  }

  testWidgets('light 390x844', (t) async => shot(t, Brightness.light, 'light'));
  testWidgets('dark 390x844', (t) async => shot(t, Brightness.dark, 'dark'));
}
