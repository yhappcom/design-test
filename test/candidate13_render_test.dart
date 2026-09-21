import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../candidate13/home_candidate_13.dart';

Future<void> render(WidgetTester tester, Brightness brightness, String name) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final key = GlobalKey();
  await tester.pumpWidget(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, brightness: brightness),
    home: RepaintBoundary(key: key, child: const Candidate13Home()),
  ));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
  expect(tester.takeException(), isNull);
  final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
  final bytes = await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 1);
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    final out = data!.buffer.asUint8List();
    image.dispose();
    return out;
  });
  final file = File('candidate13/rendered/$name.png');
  await tester.runAsync(() async {
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes!);
  });
}

void main() {
  setUpAll(() async {
    final loader = FontLoader('C13Roboto')..addFont(rootBundle.load('candidate13/fonts/Roboto.ttf'));
    await loader.load();
  });
  testWidgets('render candidate13 light', (tester) async {
    await render(tester, Brightness.light, 'candidate13-light-390x844');
  });
  testWidgets('render candidate13 dark', (tester) async {
    await render(tester, Brightness.dark, 'candidate13-dark-390x844');
  });
}
