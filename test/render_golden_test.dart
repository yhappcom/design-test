import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logmate_visual_preview/first_use.dart';
import 'package:logmate_visual_preview/home_v0_5.dart';
import 'package:logmate_visual_preview/home_v0_7.dart';
import 'package:logmate_visual_preview/home_v0_8.dart';
import 'package:logmate_visual_preview/home_v0_9.dart';
import 'package:logmate_visual_preview/home_v0_10.dart';
import 'package:logmate_visual_preview/home_v0_11.dart';
import 'package:logmate_visual_preview/premium_v0_6.dart';
import 'package:logmate_visual_preview/tokens.dart';

const _reviewFontFamily = 'PreviewSans';
const _reviewDataFontFamily = 'PreviewData';

Future<void> _loadReviewFont() async {
  final candidates = [
    (
      files: [
        '/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf',
        '/usr/share/fonts/truetype/noto/NotoSans-Medium.ttf',
        '/usr/share/fonts/truetype/noto/NotoSans-SemiBold.ttf',
        '/usr/share/fonts/truetype/noto/NotoSans-Bold.ttf',
      ],
      label: 'Noto Sans',
    ),
    (
      files: [
        '/usr/share/fonts/truetype/clear-sans/ClearSans-Regular.ttf',
        '/usr/share/fonts/truetype/clear-sans/ClearSans-Medium.ttf',
        '/usr/share/fonts/truetype/clear-sans/ClearSans-Bold.ttf',
      ],
      label: 'Clear Sans',
    ),
    (
      files: [
        '/usr/share/fonts/truetype/liberation2/LiberationSans-Regular.ttf',
        '/usr/share/fonts/truetype/liberation2/LiberationSans-Bold.ttf',
      ],
      label: 'Liberation Sans 2',
    ),
    (
      files: [
        '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf',
        '/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf',
      ],
      label: 'Liberation Sans',
    ),
    (
      files: [
        '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf',
        '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
      ],
      label: 'DejaVu Sans',
    ),
  ];

  final candidate = candidates.firstWhere(
    (candidate) => candidate.files.every((path) => File(path).existsSync()),
    orElse: () => throw StateError(
      'No complete review sans family found on CI runner.',
    ),
  );

  final loader = FontLoader(_reviewFontFamily);
  for (final path in candidate.files) {
    final bytes = await File(path).readAsBytes();
    loader.addFont(
      Future<ByteData>.value(
        ByteData.sublistView(Uint8List.fromList(bytes)),
      ),
    );
  }
  await loader.load();
  debugPrint('Golden review font: ${candidate.label}');

  final monoCandidates = [
    (
      regular: '/usr/share/fonts/truetype/liberation2/LiberationMono-Regular.ttf',
      bold: '/usr/share/fonts/truetype/liberation2/LiberationMono-Bold.ttf',
      label: 'Liberation Mono 2',
    ),
    (
      regular: '/usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf',
      bold: '/usr/share/fonts/truetype/liberation/LiberationMono-Bold.ttf',
      label: 'Liberation Mono',
    ),
    (
      regular: '/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf',
      bold: '/usr/share/fonts/truetype/dejavu/DejaVuSansMono-Bold.ttf',
      label: 'DejaVu Sans Mono',
    ),
  ];

  final mono = monoCandidates.firstWhere(
    (candidate) =>
        File(candidate.regular).existsSync() && File(candidate.bold).existsSync(),
    orElse: () => throw StateError(
      'No complete review data-mono family found on CI runner.',
    ),
  );

  final dataLoader = FontLoader(_reviewDataFontFamily);
  for (final path in [mono.regular, mono.bold]) {
    final bytes = await File(path).readAsBytes();
    dataLoader.addFont(
      Future<ByteData>.value(
        ByteData.sublistView(Uint8List.fromList(bytes)),
      ),
    );
  }
  await dataLoader.load();
  debugPrint('Golden review data font: ${mono.label}');

  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot != null) {
    final iconFile = File(
      '$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
    );
    if (iconFile.existsSync()) {
      final iconBytes = await iconFile.readAsBytes();
      final iconLoader = FontLoader('MaterialIcons')
        ..addFont(
          Future<ByteData>.value(
            ByteData.sublistView(Uint8List.fromList(iconBytes)),
          ),
        );
      await iconLoader.load();
    }
  }
}

Widget _goldenHost({
  required Widget child,
  required Brightness brightness,
}) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: PreviewTheme.light(fontFamily: _reviewFontFamily),
    darkTheme: PreviewTheme.dark(fontFamily: _reviewFontFamily),
    themeMode:
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
    home: child,
  );
}

Future<void> _golden(
  WidgetTester tester, {
  required Widget child,
  required Brightness brightness,
  required String fileName,
}) async {
  await tester.binding.setSurfaceSize(const Size(390, 844));
  addTearDown(() => tester.binding.setSurfaceSize(null));

  await tester.pumpWidget(
    _goldenHost(child: child, brightness: brightness),
  );
  await tester.pumpAndSettle();

  await expectLater(
    find.byType(Scaffold).first,
    matchesGoldenFile('goldens/$fileName'),
  );
}

void main() {
  setUpAll(_loadReviewFont);





  testWidgets('Home v0.11 system light golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV011(),
      brightness: Brightness.light,
      fileName: 'home_b_v0_11_system_light.png',
    );
  });

  testWidgets('Home v0.11 system dark golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV011(),
      brightness: Brightness.dark,
      fileName: 'home_b_v0_11_system_dark.png',
    );
  });

  testWidgets('Home v0.10 precision light golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV010(),
      brightness: Brightness.light,
      fileName: 'home_b_v0_10_precision_light.png',
    );
  });

  testWidgets('Home v0.10 precision dark golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV010(),
      brightness: Brightness.dark,
      fileName: 'home_b_v0_10_precision_dark.png',
    );
  });

  testWidgets('Home v0.9 balanced grid light golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV09(),
      brightness: Brightness.light,
      fileName: 'home_b_v0_9_balanced_grid_light.png',
    );
  });

  testWidgets('Home v0.9 balanced grid dark golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV09(),
      brightness: Brightness.dark,
      fileName: 'home_b_v0_9_balanced_grid_dark.png',
    );
  });

  testWidgets('Home v0.8 stable data light golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV08(),
      brightness: Brightness.light,
      fileName: 'home_b_v0_8_stable_data_light.png',
    );
  });

  testWidgets('Home v0.8 stable data dark golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV08(),
      brightness: Brightness.dark,
      fileName: 'home_b_v0_8_stable_data_dark.png',
    );
  });

  testWidgets('Home v0.7.1 calibrated light golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV07(),
      brightness: Brightness.light,
      fileName: 'home_b_v0_7_1_calibrated_light.png',
    );
  });

  testWidgets('Home v0.7.1 calibrated dark golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV07(),
      brightness: Brightness.dark,
      fileName: 'home_b_v0_7_1_calibrated_dark.png',
    );
  });

  testWidgets('Home v0.6 premium light golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV06(),
      brightness: Brightness.light,
      fileName: 'home_b_v0_6_premium_light.png',
    );
  });

  testWidgets('Home v0.6 premium dark golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV06(),
      brightness: Brightness.dark,
      fileName: 'home_b_v0_6_premium_dark.png',
    );
  });

  testWidgets('Home v0.5 light golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV05(),
      brightness: Brightness.light,
      fileName: 'home_b_v0_5_light.png',
    );
  });

  testWidgets('Home v0.5 dark golden', (tester) async {
    await _golden(
      tester,
      child: const HomeV05(),
      brightness: Brightness.dark,
      fileName: 'home_b_v0_5_dark.png',
    );
  });

  testWidgets('Welcome light golden', (tester) async {
    await _golden(
      tester,
      child: const WelcomePreview(),
      brightness: Brightness.light,
      fileName: 'welcome_light.png',
    );
  });

  testWidgets('Welcome dark golden', (tester) async {
    await _golden(
      tester,
      child: const WelcomePreview(),
      brightness: Brightness.dark,
      fileName: 'welcome_dark.png',
    );
  });

  testWidgets('Previous Total carry light golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _goldenHost(
        child: const PreviousTotalPreview(),
        brightness: Brightness.light,
      ),
    );
    await tester.tap(find.text('Carry forward totals'));
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(Scaffold).first,
      matchesGoldenFile('goldens/previous_total_carry_light.png'),
    );
  });

  testWidgets('Previous Total carry dark golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _goldenHost(
        child: const PreviousTotalPreview(),
        brightness: Brightness.dark,
      ),
    );
    await tester.tap(find.text('Carry forward totals'));
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(Scaffold).first,
      matchesGoldenFile('goldens/previous_total_carry_dark.png'),
    );
  });

  testWidgets('Empty Home v0.5 light golden', (tester) async {
    await _golden(
      tester,
      child: const EmptyHomePreview(),
      brightness: Brightness.light,
      fileName: 'empty_home_light.png',
    );
  });

  testWidgets('Empty Home v0.5 dark golden', (tester) async {
    await _golden(
      tester,
      child: const EmptyHomePreview(),
      brightness: Brightness.dark,
      fileName: 'empty_home_dark.png',
    );
  });
}
