import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_test/home_candidate_22_flight_manifest.dart';

Future<void> render(WidgetTester tester,Brightness b,String name) async {
  tester.view.physicalSize=const Size(390,844); tester.view.devicePixelRatio=1.0;
  await tester.pumpWidget(MaterialApp(theme:ThemeData(brightness:b,useMaterial3:true),home:RepaintBoundary(key:const Key('shot'),child:Scaffold(body:HomeCandidate22FlightManifest())))); await tester.pumpAndSettle();
  final boundary=tester.renderObject<RenderRepaintBoundary>(find.byKey(const Key('shot'))); final ui.Image image=await boundary.toImage(pixelRatio:1); final data=await image.toByteData(format:ui.ImageByteFormat.png); await File(name).writeAsBytes(data!.buffer.asUint8List());
}
void main(){testWidgets('candidate22 light dark 390x844',(tester) async {await render(tester,Brightness.light,'candidate22_light_390x844.png');await render(tester,Brightness.dark,'candidate22_dark_390x844.png');});}
