import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import '../lib/home_candidate_17.dart';

Future<void> render(WidgetTester tester, Brightness brightness, String name) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final key = GlobalKey();
  await tester.pumpWidget(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: brightness, useMaterial3: true, fontFamily: 'C17Sans'),
    home: RepaintBoundary(key: key, child: const HomeCandidate17()),
  ));
  await tester.pumpAndSettle();
  expect(tester.takeException(), isNull);
  final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
  final bytes = await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 1);
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    return data!.buffer.asUint8List();
  });
  final file = File('candidate17/rendered/$name.png');
  await tester.runAsync(() async {
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes!);
  });
}

void main() {
  setUpAll(() async {
    final sans = FontLoader('C17Sans')..addFont(rootBundle.load('candidate17/fonts/Inter.ttf'));
    final mono = FontLoader('C17Mono')..addFont(rootBundle.load('candidate17/fonts/RobotoMono.ttf'));
    await sans.load();
    await mono.load();
  });
  testWidgets('candidate17 light 390x844', (t) => render(t, Brightness.light, 'candidate17-light-390x844'));
  testWidgets('candidate17 dark 390x844', (t) => render(t, Brightness.dark, 'candidate17-dark-390x844'));
}
