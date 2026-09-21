import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logmate_visual_preview/home_candidate_01_reference.dart';

Future<void> _loadFonts() async {
  final sansCandidates = <List<String>>[
    [
      '/usr/share/fonts/truetype/liberation2/LiberationSans-Regular.ttf',
      '/usr/share/fonts/truetype/liberation2/LiberationSans-Bold.ttf',
    ],
    [
      '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf',
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ],
  ];
  final sans = sansCandidates.firstWhere(
    (set) => set.every((p) => File(p).existsSync()),
    orElse: () => throw StateError('No deterministic sans font found'),
  );
  final sansLoader = FontLoader('PreviewSans');
  for (final path in sans) {
    final bytes = await File(path).readAsBytes();
    sansLoader.addFont(Future<ByteData>.value(ByteData.sublistView(Uint8List.fromList(bytes))));
  }
  await sansLoader.load();

  final monoPath = [
    '/usr/share/fonts/truetype/liberation2/LiberationMono-Regular.ttf',
    '/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf',
  ].firstWhere((p) => File(p).existsSync());
  final monoBytes = await File(monoPath).readAsBytes();
  final monoLoader = FontLoader('PreviewMono')
    ..addFont(Future<ByteData>.value(ByteData.sublistView(Uint8List.fromList(monoBytes))));
  await monoLoader.load();

  final root = Platform.environment['FLUTTER_ROOT'];
  if (root != null) {
    final iconFile = File('$root/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf');
    if (iconFile.existsSync()) {
      final bytes = await iconFile.readAsBytes();
      final loader = FontLoader('MaterialIcons')
        ..addFont(Future<ByteData>.value(ByteData.sublistView(Uint8List.fromList(bytes))));
      await loader.load();
    }
  }
}

void main() {
  setUpAll(_loadFonts);

  testWidgets('Candidate 01 owner-reference reconstruction 390x844', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          fontFamily: 'PreviewSans',
        ),
        home: const HomeCandidate01Reference(),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFile('goldens/candidate01_reconstruction_390x844.png'),
    );
  });
}
