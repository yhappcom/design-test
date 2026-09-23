import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/home_candidate_22_flight_manifest.dart';

Future<void> loadRenderFont() async {
  final bytes = await File('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf').readAsBytes();
  final data = ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.lengthInBytes);
  final loader = FontLoader('CandidateRenderFont')
    ..addFont(Future<ByteData>.value(data));
  await loader.load();
}

Future<void> render(
  WidgetTester tester,
  Brightness brightness,
  String fileName,
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
  await tester.pumpAndSettle();

  final boundary = tester.renderObject<RenderRepaintBoundary>(
    find.byKey(const Key('shot')),
  );
  final ui.Image image = await boundary.toImage(pixelRatio: 1);
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  await File(fileName).writeAsBytes(data!.buffer.asUint8List());
}

void main() {
  setUpAll(loadRenderFont);

  testWidgets('candidate22 light dark 390x844', (tester) async {
    await render(tester, Brightness.light, 'candidate22_light_390x844.png');
    await render(tester, Brightness.dark, 'candidate22_dark_390x844.png');
  });
}
