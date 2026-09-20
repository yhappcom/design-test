import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logmate_visual_preview/home_candidate_12_visual.dart';

const _sans='PreviewSans';

Future<void> _loadFonts() async {
  final sansSets=[
    ['/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf','/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf'],
    ['/usr/share/fonts/truetype/liberation2/LiberationSans-Regular.ttf','/usr/share/fonts/truetype/liberation2/LiberationSans-Bold.ttf'],
  ];
  final sans=sansSets.firstWhere((s)=>s.every((p)=>File(p).existsSync()),
    orElse:()=>throw StateError('No deterministic sans family found'));
  final sansLoader=FontLoader(_sans);
  for(final path in sans){
    final bytes=await File(path).readAsBytes();
    sansLoader.addFont(Future<ByteData>.value(ByteData.sublistView(Uint8List.fromList(bytes))));
  }
  await sansLoader.load();

  final monoCandidates=[
    '/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf',
    '/usr/share/fonts/truetype/liberation2/LiberationMono-Regular.ttf',
  ];
  final monoPath=monoCandidates.firstWhere((p)=>File(p).existsSync(),
    orElse:()=>throw StateError('No deterministic mono family found'));
  final monoBytes=await File(monoPath).readAsBytes();
  final monoLoader=FontLoader('monospace')
    ..addFont(Future<ByteData>.value(ByteData.sublistView(Uint8List.fromList(monoBytes))));
  await monoLoader.load();

  final root=Platform.environment['FLUTTER_ROOT'];
  if(root!=null){
    final icon=File('$root/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf');
    if(icon.existsSync()){
      final bytes=await icon.readAsBytes();
      final loader=FontLoader('MaterialIcons')
        ..addFont(Future<ByteData>.value(ByteData.sublistView(Uint8List.fromList(bytes))));
      await loader.load();
    }
  }
}

Future<void> _render(WidgetTester tester,Brightness brightness,String file) async {
  await tester.binding.setSurfaceSize(const Size(390,844));
  addTearDown(()=>tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(MaterialApp(
    debugShowCheckedModeBanner:false,
    theme:ThemeData(brightness:Brightness.light,fontFamily:_sans),
    darkTheme:ThemeData(brightness:Brightness.dark,fontFamily:_sans),
    themeMode:brightness==Brightness.dark?ThemeMode.dark:ThemeMode.light,
    home:const HomeCandidate12Visual(),
  ));
  await tester.pumpAndSettle();
  expect(tester.takeException(),isNull);
  await expectLater(find.byType(Scaffold).first,matchesGoldenFile('goldens/$file'));
}

void main(){
  setUpAll(_loadFonts);
  testWidgets('Candidate 12 light 390x844',(tester) async {
    await _render(tester,Brightness.light,'candidate12_light_390x844.png');
  });
  testWidgets('Candidate 12 dark 390x844',(tester) async {
    await _render(tester,Brightness.dark,'candidate12_dark_390x844.png');
  });
}
