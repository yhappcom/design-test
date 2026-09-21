import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../candidate14/home_candidate_14.dart';

Future<void> render(WidgetTester tester,Brightness b,String name) async {
  tester.view.physicalSize=const Size(390,844);
  tester.view.devicePixelRatio=1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final key=GlobalKey();
  await tester.pumpWidget(MaterialApp(debugShowCheckedModeBanner:false,
    theme:ThemeData(useMaterial3:true,brightness:b,fontFamily:'C14Roboto'),
    home:RepaintBoundary(key:key,child:const Candidate14Home())));
  await tester.pump();
  await tester.pump(const Duration(milliseconds:100));
  expect(tester.takeException(),isNull);
  final boundary=key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
  final bytes=await tester.runAsync(() async {
    final image=await boundary.toImage(pixelRatio:1);
    final data=await image.toByteData(format:ui.ImageByteFormat.png);
    final out=data!.buffer.asUint8List(); image.dispose(); return out;
  });
  final file=File('candidate14/rendered/$name.png');
  await tester.runAsync(() async {await file.parent.create(recursive:true);await file.writeAsBytes(bytes!);});
}
void main(){
  setUpAll(() async {
    final loader=FontLoader('C14Roboto')..addFont(rootBundle.load('candidate14/fonts/Roboto.ttf'));
    await loader.load();
  });
  testWidgets('candidate14 light',(t) async=>render(t,Brightness.light,'candidate14-light-390x844'));
  testWidgets('candidate14 dark',(t) async=>render(t,Brightness.dark,'candidate14-dark-390x844'));
}
